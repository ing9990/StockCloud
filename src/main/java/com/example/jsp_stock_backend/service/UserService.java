package com.example.jsp_stock_backend.service;

import com.example.jsp_stock_backend.domain.Role;
import com.example.jsp_stock_backend.domain.User;
import com.example.jsp_stock_backend.dto.AddStockDto;
import com.example.jsp_stock_backend.dto.AddUserDto;
import com.example.jsp_stock_backend.dto.UserEdItDto;
import com.example.jsp_stock_backend.mod.pythonTest.Main;
import com.example.jsp_stock_backend.repository.UserRepository;
import com.example.jsp_stock_backend.serviceMail.MailService;
import com.example.jsp_stock_backend.utils.GivenUsername;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author TaeWK
 */

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    public final UserRepository userRepository;
    public final GivenUsername givenUsername;
    private final MailService mailService;

    static boolean is_updated = false;
    static Map<String, Integer> usernameHash = new HashMap<>();
    // -------------------------------------------//


    private void updateUsernameHash() {
        if (!is_updated) {
            givenUsername.getUsers().forEach(
                    x -> {
                        usernameHash.put(x.getUsername(), null);
                    });
            is_updated = true;
        }
    }

    public void makeWordCloud() {
        new Main();
    }

    public List<User> findAllUsers() {
        List<User> list;
        list = userRepository.findAll();
        log.info(list.size() + "명이 조회되었습니다.");
        return userRepository.findAll();
    }


    public void addUser(AddUserDto addUserDto) {
        updateUsernameHash();

        if (!usernameHash.containsKey(addUserDto.getUsername())) {
            User user = new User();
            user.setLogin_id(addUserDto.getLogin_id());
            user.setLogin_password(addUserDto.getLogin_password());
            user.setUsername(addUserDto.getUsername());
            userRepository.save(user);
            log.info(user + "님이 회원가입을 했습니다.");
        } else return;
    }

    public void deleteUserById(Long id) {
        log.info(userRepository.getById(id).getUsername() + "님이 퇴출당했습니다.");
        userRepository.deleteById(id);
    }

    public User findUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(RuntimeException::new);
    }

    public List<User> findUsersByUsername(String username) {
        List<User> list = userRepository.findUsersByUsername(username);
        log.info("이름이 " + username + "인 회원 " + list.size() + "명을 찾았습니다.");
        return list;
    }

    public User editRole(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(RuntimeException::new);

        Role role = user.getRole();

        if (role == Role.BRONZE) {
            log.info(user.getUsername() + "님의 등급이 SILVER로 승급했습니다.");
            user.setRole(Role.SILVER);
        } else if (role == Role.SILVER) {
            log.info(user.getUsername() + "님으 등급이 GOLD로 승급했습니다.");
            user.setRole(Role.GOLD);
        } else if (role == Role.GOLD) {
            log.info(user.getUsername() + "님의 등급이 VIP로 승급했습니다.");
            user.setRole(Role.VIP);
        } else if (role == Role.VIP) {
            log.info("VIP는 최고 등급입니다.");
        } else if (role == Role.ADMIN) {
            log.info("관리자는 등급을 상승시킬 수 없습니다.");
        }
        userRepository.save(user);

        return user;
    }


    public void sendMail(String username, String email) {
        mailService.sendMail(username, email);
    }

    public User edit2Role(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(RuntimeException::new);

        Role role = user.getRole();

        if (role == Role.BRONZE) {
            log.info("브론즈는 더 이상 강등될 수 없습니다.");
        } else if (role == Role.SILVER) {
            log.info(user.getUsername() + "님의 등급이 브론즈로 강등됐습니다.");
            user.setRole(Role.BRONZE);

        } else if (role == Role.GOLD) {
            log.info(user.getUsername() + "님의 등급이 실버로 강등됐습니다.");
            user.setRole(Role.SILVER);
        } else if (role == Role.VIP) {
            user.setRole(Role.GOLD);
        } else if (role == Role.ADMIN) {
            log.info("관리자는 등급을 상승시킬 수 없습니다.");
        }
        userRepository.save(user);

        return user;
    }

    public String editUserInfo(Long id, UserEdItDto dto) {

        var user = userRepository.findById(id).orElseThrow(RuntimeException::new);
        String name = user.getUsername();

        System.out.println(user);

        user.setLogin_id(dto.getInfoUserId());
        user.setLogin_password(dto.getInfoUserPassword());
        user.setRole(dto.getInfoUserRole());
        user.setUsername(dto.getInfoUserName());
        user.setEmail(dto.getInfoUserEmail());

        userRepository.save(user);

        return name;
    }

    @SneakyThrows
    public String getStockcode(String stockname) {

        String url = "https://kr.investing.com/search/?q=" + stockname;

        Document document = null;
        document = Jsoup.connect(url).get();

        Elements el = document.body().getElementsByClass("js-inner-all-results-quotes-wrapper newResultsContainer quatesTable");

        try {
            Element el2 = el.get(0);
            Elements result = el2.getElementsByClass("second");
            System.out.println(result.get(0).text());

            for (char c : result.get(0).text().toCharArray())
                if (!Character.isDigit(c))
                    return "NOCATCH";

            return result.get(0).text();
        } catch (Exception e) {
            System.out.println(stockname + "은 없는 종목입니다.");
            return "NOCATCH";
        }

    }
}
