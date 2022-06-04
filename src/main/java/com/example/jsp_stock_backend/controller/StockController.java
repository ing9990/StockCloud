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


    // 매수
    @PostMapping("/stock/buy")
    public void buy_stock(@RequestBody BuyStockVO buyStockvo) {

        log.info(buyStockvo.getUser_id() + "번 유저가 "
                + buyStockvo.getStock_name() + " " + buyStockvo.getCount()
                + "주를 매수하셨습니다.");

        stockService.buyStock(buyStockvo);
    }


    // 매도
    @PostMapping("/stock/sell")
    public void sell_stock(@RequestBody SellStockVO sellStockvo) {
        log.info(sellStockvo.getUser_id() + "번 유저가 "
                + sellStockvo.getStock_name() + " " + sellStockvo.getCount()
                + "주를 매도 했습니다.");

        stockService.sellStock(sellStockvo);
    }


}
