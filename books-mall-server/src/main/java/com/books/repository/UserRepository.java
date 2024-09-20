package com.books.repository;

import com.books.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<User, String> {
    /**
     * 查询邮箱是否存在
     *
     * @param email 邮箱
     * @return 存在?
     */
    boolean existsByEmail(String email);
}
