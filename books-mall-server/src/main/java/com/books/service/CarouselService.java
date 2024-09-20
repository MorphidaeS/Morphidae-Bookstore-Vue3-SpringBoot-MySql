package com.books.service;

import com.books.dto.CarouselDTO;
import com.books.entity.Carousel;

import java.util.List;


public interface CarouselService {
    /**
     * 获取所有走马灯列表
     *
     * @param type 类型
     * @return 走马灯集合
     */
    List<Carousel> getAll(int type);

    /**
     * 添加走马灯
     *
     * @param url  网址
     * @param link 链接
     * @param type 类型
     * @return 新增的走马灯
     */
    Carousel add(String url, String link, int type);

    /**
     * 删除走马灯
     *
     * @param id ID
     */
    void del(String id);

    /**
     * 修改走马灯
     *
     * @param carousel 走马灯
     */
    void modify(CarouselDTO carousel);
}
