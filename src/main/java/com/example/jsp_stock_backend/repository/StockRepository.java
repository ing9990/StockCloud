package com.example.jsp_stock_backend.repository;

import com.example.jsp_stock_backend.domain.Stock;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Taewoo
 */

public interface StockRepository extends JpaRepository<Stock, String> {
}
