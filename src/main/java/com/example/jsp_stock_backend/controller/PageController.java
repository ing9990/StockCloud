package com.example.jsp_stock_backend.controller;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.serviceMail.MailService;
import com.example.jsp_stock_backend.servicePage.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PageController {

    private final LoginService loginService; // DI

    // -------------------- GET CONTROLLER ---------------------------\\


    // DEFAULT PAGE
    @GetMapping("")
    public String indexPage(HttpSession session) {
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

    @GetMapping("/user-info")
    public String userInfo() {
        return "user-info.jsp";
    }

    @GetMapping("/get-demo")
    public String getDemo(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
        return "get-demo.jsp";
    }


    // -------------------- POST CONTROLLER -------------------------- \\

    // JOIN - PROCESS
    @PostMapping("/join-process")
    public String joinPage(HttpServletRequest req, HttpServletResponse res) {

        String name = req.getParameter("username");
        String id = req.getParameter("id");
        String password = req.getParameter("pw");
        String token = req.getParameter("token_input");
        String email = req.getParameter("email");

        loginService.addUser(name, id, password, email);
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

                var dto = loginService.getUser(id, pw);

                session.setAttribute("id", dto.getUser_id()); // Long Type PK ID
                session.setAttribute("is_login", "");    //

                session.setAttribute("username", name);
                session.setAttribute("login_id", dto.getUser_login_id()); // String Type LOGIN ID
                session.setAttribute("login_password", dto.getUser_login_password());
                session.setAttribute("role", dto.getRole());
                session.setAttribute("email", dto.getUser_email());

                return "main.jsp";
            }
        } else {
            session.setAttribute("is_login", "로그인에 실패하셨습니다.");
            return "login.jsp";
        }
    }

    // logout
    @PostMapping("/logout-process")
    public String logout(HttpServletRequest req, HttpServletResponse res, HttpSession session) {

        session.removeAttribute("id");

        session.removeAttribute("username");
        session.removeAttribute("login_id");
        session.removeAttribute("login_password");
        session.removeAttribute("role");

        return "login.jsp";
    }


}
