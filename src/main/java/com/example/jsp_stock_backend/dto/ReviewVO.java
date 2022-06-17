package com.example.jsp_stock_backend.dto;

/**
 * @author Taewoo
 */


import lombok.*;

import java.util.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReviewVO {
    // 이름
    private String name;
    // 디자인 점수
    private int design_evaluation_score;
    // 아이디어 점수
    private int idea_evaluation_score;
    // 한줄 평가
    private String letter_evaluation;
    // 총점
    private int total_score;

}
