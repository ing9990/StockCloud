package com.example.jsp_stock_backend.domain;

import lombok.*;
import org.apache.tomcat.jni.Local;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @author TaeWK
 */

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Builder
@ToString
@Table(name = "USER_TABLE")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USER_ID")
    private Long user_id; // PK

    @Column(name = "LOGIN_ID", nullable = false, unique = true)
    private String login_id; //LOGIN ID

    @Column(name = "LOGIN_PASSWORD", nullable = false)
    private String login_password; //LOGIN PASSWORD

    @Column(name = "USER_NAME", nullable = false, unique = true)
    private String username; // USERNAME

    @Column(name = "USER_EMAIL", nullable = false, unique = true)
    private String email;   // EMAIL

    @Enumerated(EnumType.STRING)
    @Column(name = "ROLE")
    private Role role = Role.BRONZE; // USER GRADE

    @Column(name = "USER_CREATED_AT")
    private LocalDateTime created_at = LocalDateTime.now(); //USER CREATED DATE

    @Column(name = "USER_MONEY")
    private int money = 1000000;

}















