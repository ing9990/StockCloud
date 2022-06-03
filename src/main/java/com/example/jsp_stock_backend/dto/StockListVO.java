package com.example.jsp_stock_backend.dto;

/**
 * @author Taewoo
 */


import lombok.*;

import java.util.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class StockListVO {

    private String stockname;

    private int count;

    private int price;

}
