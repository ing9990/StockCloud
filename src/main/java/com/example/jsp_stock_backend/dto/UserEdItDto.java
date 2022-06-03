package com.example.jsp_stock_backend.dto;

/**
 * @author Taewoo
 */


import com.example.jsp_stock_backend.domain.Role;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.*;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class UserEdItDto {

    private String infoUserId;
    private String infoUserPassword;
    private Role infoUserRole;
    private String infoUserName;
    private String infoUserEmail;

}
