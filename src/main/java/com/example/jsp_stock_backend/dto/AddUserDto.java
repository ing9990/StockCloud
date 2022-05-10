package com.example.jsp_stock_backend.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author TaeWK
 */

@Getter
@Setter
@NoArgsConstructor
public class AddUserDto {

    private String login_id;

    private String login_password;

    private String username;
}
