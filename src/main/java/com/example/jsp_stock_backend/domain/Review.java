package com.example.jsp_stock_backend.domain;

/**
 * @author Taewoo
 */


import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;
import java.util.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long review_id;

    private String name;

    private int design_evaluation_score;

    private int idea_evaluation_score;

    private String letter_evaluation;

    private int total_score;

    private LocalDateTime rate_at = LocalDateTime.now();
}
