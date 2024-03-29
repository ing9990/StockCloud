package com.example.jsp_stock_backend.serviceStock;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.domain.Trade;
import com.example.jsp_stock_backend.dto.BuyStockVO;
import com.example.jsp_stock_backend.dto.SellStockVO;
import com.example.jsp_stock_backend.dto.StockListVO;
import com.example.jsp_stock_backend.repository.TradeRepository;
import com.example.jsp_stock_backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@Service
@RequiredArgsConstructor
public class StockService {

    private final TradeRepository tradeRepository;
    private final UserRepository userRepository;


    // 같은 종목을 구매한 내역이 있는지 확인하는 메서드
    private boolean is_exist_stock(String stockname, Long user_id) {
        return tradeRepository.findAll().stream().anyMatch((x) -> x.getStockname().equals(stockname) && x.getUser_id() == user_id);
    }


    @Transactional
    public void buyStock(BuyStockVO buyStockvo) {

        Trade trade = new Trade(); // 이미 종목이 있다면
        boolean is_exist = is_exist_stock(buyStockvo.getStock_name(), buyStockvo.getUser_id());

        // 주식 구매 로직 & 평단가 계산 로직.
        if (is_exist) {
            tradeRepository.findAll().forEach((x) -> {
                if (x.getStockname().equals(buyStockvo.getStock_name()) && x.getUser_id() == buyStockvo.getUser_id()) {

                    var user = userRepository.findById(x.getUser_id()).orElseThrow(RuntimeException::new);

                    user.setMoney(user.getMoney() - buyStockvo.getPrice() * buyStockvo.getCount());

                    x.setPrice(((x.getPrice() * x.getCount()) + (buyStockvo.getCount() * buyStockvo.getPrice())) / (x.getCount() + buyStockvo.getCount()));
                    x.setCount(x.getCount() + buyStockvo.getCount());

                    return;
                }
            });
        } else {
            // 주식 구매 로직

            var user = userRepository.findById(buyStockvo.getUser_id()).orElseThrow(RuntimeException::new);

            trade.setUser_id(buyStockvo.getUser_id());
            trade.setStockname(buyStockvo.getStock_name());
            trade.setUsername(userRepository.findById(buyStockvo.getUser_id()).get().getUsername());
            trade.setPrice(buyStockvo.getPrice());
            trade.setCount(buyStockvo.getCount());

            user.setMoney(user.getMoney() - trade.getPrice() * trade.getCount());

            tradeRepository.save(trade);
            userRepository.save(user);
        }
    }


    @Transactional
    public void sellStock(SellStockVO sellStockvo) {

        var user = userRepository.findById(sellStockvo.getUser_id()).orElseThrow(RuntimeException::new);
        int tax = tax(sellStockvo.getUser_id(), sellStockvo.getPrice() * sellStockvo.getCount());

        for (Trade trade : tradeRepository.findAll()) {
            if (sellStockvo.getUser_id() == trade.getUser_id() && trade.getStockname().equals(sellStockvo.getStock_name())) {
                if (sellStockvo.getCount() == trade.getCount()) {
                    // sell all
                    user.setMoney((user.getMoney() + sellStockvo.getCount() * sellStockvo.getPrice()) - tax);
                    tradeRepository.delete(trade);
                } else {
                    // sell some
                    user.setMoney((user.getMoney() + sellStockvo.getCount() * sellStockvo.getPrice()) - tax);
                    trade.setCount(trade.getCount() - sellStockvo.getCount());
                }
            }
        }
        userRepository.save(user);
    }

    @Transactional
    public List<StockListVO> getList(Long id) {
        List<StockListVO> list = new ArrayList<>();

        for (Trade trade : tradeRepository.findAll()) {
            if (trade.getUser_id() == id) {
                StockListVO tmp = new StockListVO();

                tmp.setStockname(trade.getStockname());
                tmp.setPrice(trade.getPrice());
                tmp.setCount(trade.getCount());

                list.add(tmp);
            }
        }
        return list;
    }

    public int getMoney(Long id) {
        return userRepository.findById(id).orElseThrow(RuntimeException::new).getMoney();
    }

    public String getAppKey(Long id) {
        return userRepository.findById(id).orElseThrow(RuntimeException::new).getAppkey();
    }

    public String getAppSec(Long id) {
        return userRepository.findById(id).orElseThrow(RuntimeException::new).getAppsec();
    }

    public String getAppPer(Long id) {
        return userRepository.findById(id).orElseThrow(RuntimeException::new).getAppper();
    }

    public int getAllMoney(Long id) {
        int cash = userRepository.getById(id).getMoney();
        AtomicInteger stock_money = new AtomicInteger();

        tradeRepository.findAll().forEach((x) -> {
            if (x.getUser_id() == id) {
                stock_money.addAndGet(x.getPrice() * x.getCount());
            }
        });

        return cash + stock_money.get();
    }


    private int tax(Long user_id, int price) {
        int result = 0;

        var role = userRepository.findById(user_id).get().getRole();

        switch (role) {
            case BRONZE:
                result = (price / 100 * 1);
                break;
            case SILVER:
                result = (int) (price / 100 * 0.8);
                break;
            case GOLD:
                result = (int) (price / 100 * 0.6);
                break;
            case VIP:
                result = (int) (price / 100 * 0.2);
                break;
            default:
                break;
        }
        return result;
    }

}
