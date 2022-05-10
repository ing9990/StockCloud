package com.example.jsp_stock_backend.service;

import com.example.jsp_stock_backend.domain.Role;
import com.example.jsp_stock_backend.domain.User;
import com.example.jsp_stock_backend.dto.AddUserDto;
import com.example.jsp_stock_backend.mod.pythonTest.Main;
import com.example.jsp_stock_backend.repository.UserRepository;
import com.example.jsp_stock_backend.utils.GivenUsername;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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

    public final UserRepository userRepository; // Benas 의존성 주입.
    public final GivenUsername givenUsername;

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
        log.info("워드 클라우드를 생성했습니다.");
        new Main();
    }

    public List<User> findAllUsers() {
        List<User> list = new ArrayList<>();
        list = userRepository.findAll();
        log.info(list.size()+"명이 조회되었습니다.");
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
            log.info(user+"님이 회원가입을 했습니다.");
        } else return;
    }

    public void deleteUserById(Long id) {
        log.info(userRepository.getById(id).getUsername()+"님이 퇴출당했습니다.");
        userRepository.deleteById(id);
    }

    public User findUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(RuntimeException::new);
    }

    public List<User> findUsersByUsername(String username) {
        List<User> list = userRepository.findUsersByUsername(username);
        log.info("이름이 "+username+"인 회원 " + list.size()+"명을 찾았습니다.");
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


}
