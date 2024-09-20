package com.books.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class CarouselDTO implements Serializable {
    /**
     * ID
     */
    private String id;
    /**
     * URL
     */
    private String url;
    /**
     * 轮播类型（默认水平）
     */
    private Integer type;
    /**
     * 链接
     */
    private String link;
}
