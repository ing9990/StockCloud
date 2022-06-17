package com.example.jsp_stock_backend.controller;

import com.example.jsp_stock_backend.domain.User;
import com.example.jsp_stock_backend.dto.*;
import com.example.jsp_stock_backend.service.UserService;
import com.example.jsp_stock_backend.serviceMail.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/api/v1")
@Slf4j
@RequiredArgsConstructor
public class MainController {

    // Dependency Injection
    private final UserService userService;
    private final MailService mailService;

    @GetMapping("/test")
    public String test() {
        return "test";
    }


    @GetMapping("/mail/{username}/{email}")
    public String mail(@PathVariable String username, @PathVariable String email, HttpSession session) {
        userService.sendMail(username, email);
        log.info(username + "님의 인증번호가 [" + MailService.token + "]로 생성되었습니다.");
        return MailService.token;
    }


    // -----------ADMIN GET METHOD-----------------//

    @GetMapping("/users") // 유저 리스트 조회
    public List<User> findAllUsers() {
        return userService.findAllUsers();
    }

    @GetMapping("/user/id/{id}") // 유저 아이디로 검색
    public User findUserById(@PathVariable Long id) {
        return userService.findUserById(id);
    }

    @GetMapping("/user/name/{username}") // 유저 이름으로 검색
    public List<User> findUsersByUsername(@PathVariable String username) {
        return userService.findUsersByUsername(username);
    }


    // http://localhost:8090/api/v1  GET METHOD

    // -----------USERS GET METHOD-----------------//
    @GetMapping("") // 워드 클라우드 생성.
    public void makeWordCloud() {
        log.info("워드 클라우드 생성 중..");
        userService.makeWordCloud();
    }


    @GetMapping("/get-stockcode/{stockname}")
    @ResponseBody
    public String getStockcode(@PathVariable String stockname) {
        log.info("[" + stockname + "] 종목코드 검색 ");
        return userService.getStockcode(stockname);
    }


    // --------------POST METHOD-------------- //
    @PostMapping("") // 유저 회원가입.
    public void addUser(@RequestBody AddUserDto addUserDto) {
        userService.addUser(addUserDto);
    }

    @PostMapping("/mail/user/{user_id}")
    public void sendMailUser(@PathVariable Long user_id, @RequestBody Chat chat) {
        mailService.sendMailUser(user_id, chat);
        log.info(user_id + "번 회원에게 " + "이메일 전송을 완료했습니다.");
    }


    // --------------PUT METHOD-------------- //
    @GetMapping("put/{id}") // 유저 등급 상승.
    public User editRoleById(@PathVariable Long id) {
        return userService.editRole(id);
    }

    @GetMapping("uput/{id}")
    public User edit2RoleById(@PathVariable Long id) {
        return userService.edit2Role(id);
    }


    // -------------DELETE METHOD-------------- //
    @GetMapping("delete/{id}") // 유저 퇴출.
    public void deleteUser(@PathVariable Long id) {
        userService.deleteUserById(id);
    }


    @PutMapping("/editUserInfo/{id}")
    public void editUserInfo(@PathVariable Long id, @RequestBody UserEdItDto userEdItDto, HttpSession session) {
        String name = userService.editUserInfo(id, userEdItDto);

        session.setAttribute("username", userEdItDto.getInfoUserName());
        session.setAttribute("login_id", userEdItDto.getInfoUserId());
        session.setAttribute("login_password", userEdItDto.getInfoUserPassword());
        session.setAttribute("role", userEdItDto.getInfoUserRole());

        log.info(name + "님의 정보가 수정되었습니다.");
    }


}
