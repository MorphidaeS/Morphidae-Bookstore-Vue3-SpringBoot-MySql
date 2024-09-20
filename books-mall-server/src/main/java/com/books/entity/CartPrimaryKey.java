package com.books.entity;

import lombok.Data;

import java.io.Serializable;


@Data
public class CartPrimaryKey implements Serializable {
    /**
     * 用户
     */
    private String user;
    /**
     * 商品
     */
    private String commodity;
}
