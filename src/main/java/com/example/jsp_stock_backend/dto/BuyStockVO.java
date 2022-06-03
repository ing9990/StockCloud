package com.example.jsp_stock_backend.dto;

/**
 * @author Taewoo
 */


import lombok.*;

import java.util.*;

@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
@ToString
public class BuyStockVO {
    // 구매자 이름
    private Long user_id;
    // 종목 이름
    private String stock_name;
    // 구매 가격
    private int price;
    // 구매 갯수
    private int count;
}
