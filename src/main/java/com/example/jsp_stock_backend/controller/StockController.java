package com.example.jsp_stock_backend.controller;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.dto.BuyStockVO;
import com.example.jsp_stock_backend.dto.SellStockVO;
import com.example.jsp_stock_backend.dto.StockListVO;
import com.example.jsp_stock_backend.repository.TradeRepository;
import com.example.jsp_stock_backend.repository.UserRepository;
import com.example.jsp_stock_backend.serviceStock.StockService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@Slf4j
@RequestMapping("/api/v2")
@RequiredArgsConstructor
public class StockController {

    private final StockService stockService;

    // 보유 종목
    @GetMapping("/stock/{id}")
    public List<StockListVO> getUserAccount(@PathVariable Long id) {
        log.info(id + "번 회원이 보유 종목을 조회했습니다.");
        return stockService.getList(id);
    }

    @GetMapping("/money/{id}")
    public int getMoneyByUserId(@PathVariable Long id) {
        log.info(id + "번 회원의 현금을 조회합니다.");
        return stockService.getMoney(id);
    }

    @GetMapping("/all_money/{id}")
    public int getAllMoney(@PathVariable Long id) {
        log.info(id + "번 회원의 총 자산을 조회합니다.");
        return stockService.getAllMoney(id);
    }

    @PostMapping("/stock/buy")
    public void buy_stock(@RequestBody BuyStockVO buyStockvo) {

        log.info(buyStockvo.getUser_id() + "번 유저가 " + buyStockvo.getStock_name() + " " + buyStockvo.getCount() + "주를 매수하셨습니다.");

        stockService.buyStock(buyStockvo);
    }

    @PostMapping("/stock/sell")
    public void sell_stock(@RequestBody SellStockVO sellStockvo) {
        log.info(sellStockvo.getUser_id() + "번 유저가 " + sellStockvo.getStock_name() + " " + sellStockvo.getCount() + "주를 매도 했습니다.");

        stockService.sellStock(sellStockvo);
    }

    @GetMapping("/stock/appkey/{id}")
    public String get_appkey(@PathVariable Long id) {
        log.info(id + "번 유저가 APPKEY를 조회합니다.");
        return stockService.getAppKey(id);
    }

    @GetMapping("/stock/appsec/{id}")
    public String get_appsec(@PathVariable Long id) {
        log.info(id + "번 유저가 APP SECRET을 조회합니다.");
        return stockService.getAppSec(id);
    }

    @GetMapping("/stock/appper/{id}")
    public String get_appper(@PathVariable Long id) {
        log.info(id + "번 유저가 개인 키를 조회합니다.");
        return stockService.getAppPer(id);
    }
}
