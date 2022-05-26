package com.example.jsp_stock_backend.dto;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.domain.Role;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UserDto {

    private Long user_id;
    private String username;
    private String user_login_id;
    private String user_login_password;
    private Role role;
    private String user_email;

}
