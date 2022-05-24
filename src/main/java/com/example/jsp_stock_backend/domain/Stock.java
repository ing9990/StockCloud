package com.example.jsp_stock_backend.domain;

import lombok.*;

import javax.persistence.*;

/**
 * @author TaeWK
 */

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Table(name = "stock_table")
public class Stock {

    @Id
    private String stock_name;    //주식 이름

    private int stock_rank;       //주식 순위

    private int stock_price;      //가격

    private int change_price_day; //전일비

    private int total_price;      // 시가총액

    private double chage_per_day; //등락률

    private int trading_volume;   //거래량
}
