package com.example.jsp_stock_backend.serviceMail;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.dto.Chat;
import com.example.jsp_stock_backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import net.bytebuddy.dynamic.loading.ClassInjector;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.internet.InternetAddress;
import java.util.*;

@Service
@RequiredArgsConstructor
public class MailService {

    private final UserRepository userRepository;
    private final JavaMailSender javaMailSender;

    public static String token = "";

    @SneakyThrows
    public void sendMailUser(Long user_id, Chat chat) {
        ArrayList<String> toUserList = new ArrayList<>();

        String email = userRepository.findById(user_id).get()
                .getEmail();

        toUserList.add(email);

        int toUserSize = toUserList.size();

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));

        simpleMailMessage.setFrom(String.valueOf(new InternetAddress("mail80782258@gmail.com", "StockCloud", "UTF-8")));

        String name = userRepository.findById(user_id).get().getUsername();

        simpleMailMessage.setSubject("StockCloud에서 [" + name + "] 회원님에게 알림 메일을 전송했습니다.");
        simpleMailMessage.setText(chat.getMessage());
        javaMailSender.send(simpleMailMessage);
    }

    @SneakyThrows
    public void sendMail(String username, String email) {
        ArrayList<String> toUserList = new ArrayList<>();

        toUserList.add(email);

        int toUserSize = toUserList.size();

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));

        Random random = new Random();

        token = "";

        for (int i = 0; i < 6; i++) {
            token += random.nextInt(9);
        }

        simpleMailMessage.setFrom(String.valueOf(new InternetAddress("mail80782258@gmail.com", "StockCloud-Join", "UTF-8")));
        simpleMailMessage.setSubject("인증번호입니다.");
        simpleMailMessage.setText(username + "님의 인증번호는 " + token + "입니다.");

        javaMailSender.send(simpleMailMessage);
    }
}


