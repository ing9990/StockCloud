package com.example.jsp_stock_backend.repository;

import com.example.jsp_stock_backend.domain.Role;
import com.example.jsp_stock_backend.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author TaeWK
 */

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    List<User> findUsersByUsername(String username);
}
