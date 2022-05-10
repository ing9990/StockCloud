package com.example.jsp_stock_backend.utils;

import com.example.jsp_stock_backend.dao.UserNameHashDao;
import com.example.jsp_stock_backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author TaeWK
 */


@RequiredArgsConstructor
@Service
public class GivenUsername {

    public final UserRepository userRepository;

    public List<UserNameHashDao> getUsers(){
        List<UserNameHashDao> list = new ArrayList<>();

        userRepository.findAll()
                .forEach((item) ->{
                    list.add(new UserNameHashDao(item.getUsername()));
                });

        return list;
    }
}
