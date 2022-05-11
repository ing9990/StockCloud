package com.example.jsp_stock_backend.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author TaeWK
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AddStockDto {
    private int stock_rank;       //주식 순위
    private String stock_name;    //주식 이름
    private int stock_price;      //가격
    private int change_price_day; //전일비
    private double chage_per_day; //등락률
    private int trading_volume;   //거래량
}
