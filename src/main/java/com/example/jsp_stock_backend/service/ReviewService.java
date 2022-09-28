package com.example.jsp_stock_backend.service;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.domain.Review;
import com.example.jsp_stock_backend.dto.ReviewVO;
import com.example.jsp_stock_backend.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewRepository reviewRepository;

    public void write(ReviewVO reviewVO) {
        Review review = new Review();

        review.setName(review.getName());
        review.setDesignEvaluationScore(reviewVO.getDesign_evaluation_score());
        review.setIdeaEvaluationScore(reviewVO.getIdea_evaluation_score());
        review.setLetterEvaluation(reviewVO.getLetter_evaluation());
        review.setTotalScore(reviewVO.getTotal_score());

        reviewRepository.save(review);
    }

    public void writeReview(ReviewVO reviewVO) {
        var review = Review.updateReview(
                reviewVO.getName(),
                reviewVO.getTotal_score(),
                reviewVO.getDesign_evaluation_score(),
                reviewVO.getIdea_evaluation_score(),
                reviewVO.getLetter_evaluation());

        reviewRepository.save(review);
    }
}
