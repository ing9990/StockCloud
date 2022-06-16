package com.example.jsp_stock_backend.repository;

import com.example.jsp_stock_backend.domain.Trade;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author Taewoo
 */

public interface TradeRepository extends JpaRepository<Trade, Long> {

}
