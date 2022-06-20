package com.example.jsp_stock_backend.repository;

import com.example.jsp_stock_backend.domain.Review;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Taewoo
 */

public interface ReviewRepository extends JpaRepository<Review, Long> {}
