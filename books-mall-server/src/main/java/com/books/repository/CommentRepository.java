package com.books.repository;

import com.books.entity.Comment;
import com.books.entity.Commodity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CommentRepository extends JpaRepository<Comment, String> {
    /**
     * 根据商品查询评价
     *
     * @param commodity 商品
     * @param pageable  分页
     * @return 评价集合
     */
    Page<Comment> findByCommodity(Commodity commodity, Pageable pageable);
}
