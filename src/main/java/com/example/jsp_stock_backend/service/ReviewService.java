package com.example.jsp_stock_backend.service;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.domain.Review;
import com.example.jsp_stock_backend.dto.ReviewVO;
import com.example.jsp_stock_backend.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewRepository reviewRepository;

    public void writeReview(ReviewVO reviewVO) {
        Review review = new Review();

        review.setName(reviewVO.getName());

        review.setDesign_evaluation_score(reviewVO.getDesign_evaluation_score());
        review.setIdea_evaluation_score(reviewVO.getIdea_evaluation_score());
        review.setLetter_evaluation(reviewVO.getLetter_evaluation());

        review.setTotal_score(reviewVO.getTotal_score());

        reviewRepository.save(review);
    }
}
