package com.books.service;

import com.books.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.books.dto.LoginUser;


public interface UserService {
    /**
     * 用户登录
     *
     * @param username 用户名
     * @param password 密码
     * @return jwt token
     * @throws JsonProcessingException JWT构建失败
     */
    String login(String username, String password) throws JsonProcessingException;

    /**
     * 修改用户信息
     *
     * @param loginUser 登录用户
     * @param user      新用户信息
     */
    void modifyUser(LoginUser loginUser, User user);

    /**
     * 用户注册
     *
     * @param username 用户名
     * @param email    邮箱
     * @param phone    电话
     * @param password 密码
     * @return 用户
     */
    LoginUser reg(String username, String email, String phone, String password);

    /**
     * 修改密码
     *
     * @param loginUser 登录用户
     * @param oldPwd    旧密码
     * @param newPwd    新密码
     */
    void changePwd(LoginUser loginUser, String oldPwd, String newPwd);
}
