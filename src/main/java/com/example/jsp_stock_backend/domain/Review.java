package com.example.jsp_stock_backend.domain;

/**
 * @author Taewoo
 */


import lombok.*;
import org.apache.commons.lang3.StringUtils;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString
@Builder
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long review_id;

    private String name;

    private int designEvaluationScore;

    private int ideaEvaluationScore;

    private String letterEvaluation;

    private int totalScore;

    private LocalDateTime rated = LocalDateTime.now();

    public static Review updateReview(String name, int totalScore, int designEvaluationScore, int ideaEvaluationScore, String letterEvaluation) {
        if (StringUtils.isBlank(name))
            throw new IllegalArgumentException("name 은 빈값이 될 수 없습니다: " + name);

        return Review.builder()
                .name(name)
                .designEvaluationScore(designEvaluationScore)
                .ideaEvaluationScore(ideaEvaluationScore)
                .letterEvaluation(letterEvaluation)
                .rated(LocalDateTime.now())
                .totalScore(totalScore)
                .build();
    }
}
