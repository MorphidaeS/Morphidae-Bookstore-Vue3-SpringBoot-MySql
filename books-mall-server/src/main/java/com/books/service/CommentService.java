package com.books.service;

import com.books.entity.Comment;
import com.books.dto.CommentDTO;
import com.books.dto.LoginUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


public interface CommentService {
    /**
     * 根据商品ID查找评论
     *
     * @param commodityId 商品ID
     * @param pageable    分页
     * @return 评论集合
     */
    Page<CommentDTO> findByCommodityId(String commodityId, Pageable pageable);

    /**
     * 新评论
     *
     * @param loginUser 登录用户
     * @param orderId   订单ID
     * @param content   内容
     * @return 评论
     */
    Comment newComment(LoginUser loginUser, String orderId, String content);
}
