package com.example.jsp_stock_backend.controller;

import com.example.jsp_stock_backend.mod.pythonTest.Main;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
@Slf4j
public class MainController {

    @GetMapping("/test")
    public String test(){
        return "test";
    }

    @GetMapping("")
    public void make(){
        log.info("접근했습니다.");
        new Main();
    }

}
