package com.example.jsp_stock_backend.domain;

/**
 * @author Taewoo
 */


import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.*;


@Entity
@Data
public class Trade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long trade_id;

    private Long user_id;

    private String username;

    // 종목 이름
    @Column(unique = true)
    private String stockname;

    // 구매 가격
    private int price;
    // 구매 갯수
    private int count;
    // 구매한 시간
    private LocalDateTime time_of_purchase = LocalDateTime.now();
}
