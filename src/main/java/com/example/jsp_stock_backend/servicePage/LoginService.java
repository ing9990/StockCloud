package com.example.jsp_stock_backend.servicePage;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.domain.User;
import com.example.jsp_stock_backend.dto.UserDto;
import com.example.jsp_stock_backend.dto.UserEdItDto;
import com.example.jsp_stock_backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.concurrent.atomic.AtomicReference;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final UserRepository userRepository; //DI


    public void addUser(String name, String id, String password, String email) {
        User user = new User();

        user.setLogin_id(id);
        user.setLogin_password(password);
        user.setUsername(name);
        user.setEmail(email);

        userRepository.save(user);
    }

    public String checkLogin(String id, String pw) {

        AtomicReference<String> name = new AtomicReference<>("");

        userRepository.findAll()
                .forEach((x) -> {
                    if (x.getLogin_id().equals(id) && x.getLogin_password().equals(pw)) {
                        name.set(x.getUsername());
                    }
                });

        return name.get();
    }

    public UserDto getUser(String id, String pw) {

        User user = userRepository.findAll().stream()
                .filter((x) -> x.getLogin_id().equals(id) && x.getLogin_password().equals(pw))
                .findFirst().get();

        UserDto dto = new UserDto();

        dto.setUser_login_id(user.getLogin_id());
        dto.setUser_login_password(user.getLogin_password());
        dto.setUsername(user.getUsername());
        dto.setRole(user.getRole());
        dto.setUser_id(user.getUser_id());
        dto.setUser_email(user.getEmail());


        return dto;
    }


}
