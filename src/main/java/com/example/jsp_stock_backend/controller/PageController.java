package com.example.jsp_stock_backend.controller;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.servicePage.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PageController {

    private final LoginService loginService; // DI

    // -------------------- GET CONTROLLER ---------------------------\\


    // DEFAULT PAGE
    @GetMapping("")
    public String indexPage(HttpSession session) {
        session.setAttribute("is_login", "");
        return "index.jsp";
    }


    // JOIN IN
    @GetMapping("/join")
    public String joinPage() {
        return "join.jsp";
    }

    // LOG IN
    @GetMapping("/login")
    public String loginPage() {
        return "login.jsp";
    }

    @PostMapping("/logout-process")
    public String logout(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
        session.removeAttribute("username");
        return "login.jsp";
    }


    // -------------------- POST CONTROLLER -------------------------- \\

    // JOIN - PROCESS
    @PostMapping("/join-process")
    public String joinPage(HttpServletRequest req, HttpServletResponse res) {

        String name = req.getParameter("username");
        String id = req.getParameter("id");
        String password = req.getParameter("pw");
        loginService.addUser(name, id, password);
        log.info(name + "님이 등록되었습니다.");
        return "login.jsp";
    }

    // LOGIN - PROCESS
    @PostMapping("/login-process")
    public String loginPage(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
        session.removeAttribute("username");

        String id = req.getParameter("id");
        String pw = req.getParameter("pw");
        String name = loginService.checkLogin(id, pw);

        if (!name.isEmpty()) { // login info is contains

            if (name.equals("관리자")) {
                session.setAttribute("is_login", "");
                return "admin-page.jsp";
            } else {
                session.setAttribute("username", name);
                session.setAttribute("is_login", "");
                return "main.jsp";
            }
        } else {
            session.setAttribute("is_login", "로그인에 실패하셨습니다.");
            return "login.jsp";
        }


    }


}
