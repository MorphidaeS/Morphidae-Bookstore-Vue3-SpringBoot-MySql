package com.books.repository;

import com.books.entity.Carousel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface CarouselRepository extends JpaRepository<Carousel, String> {
    /**
     * 根据类型获取轮播图
     *
     * @param type 类型
     * @return 轮播图集合
     */
    List<Carousel> findAllByType(int type);
}
