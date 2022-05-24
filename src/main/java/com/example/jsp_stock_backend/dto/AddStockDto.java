package com.example.jsp_stock_backend.dto;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;

/**
 * @author TaeWK
 */

@Getter
@Setter
@NoArgsConstructor
@Builder
@Slf4j
@AllArgsConstructor
public class AddStockDto {

    private ArrayList<String> stock_name;         //주식 이름

    private ArrayList<Integer> stock_rank;        //주식 순위

    private ArrayList<Integer> stock_price;       //가격

    private ArrayList<Integer> change_price_day;  //전일비

    private ArrayList<Double> chage_per_day;      //등락률

    private ArrayList<Integer> total_price;       //시가총액

    private ArrayList<Integer> trading_volume;    //거래량
}
