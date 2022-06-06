package com.example.jsp_stock_backend.dto;

/**
 * @author Taewoo
 */


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SellStockVO {

    private Long user_id;

    private String stock_name;

    private int price;

    private int count;
}





