package com.example.jsp_stock_backend.service;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.*;


@Service
@Slf4j
@RequiredArgsConstructor
public class StockService {

    private final UserRepository userRepository; // DI


}
