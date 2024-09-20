package com.books.entity;

import com.books.repository.CarouselRepository;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;


@Data
@Entity(name = "mall_carousel")
public class Carousel implements Serializable {
    /**
     * 水平走马灯
     */
    public static final int HORIZONTAL = 1;
    /**
     * 垂直走马灯
     */
    public static final int VERTICAL = 2;
    /**
     * ID
     */
    @Id
    @GeneratedValue(generator = "idGenerator")
    @GenericGenerator(name = "idGenerator", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(length = 36, columnDefinition = "char(36)")
    private String id;
    /**
     * URL
     */
    @Column(nullable = false, columnDefinition = "text")
    private String url;
    /**
     * 轮播类型（默认水平）
     */
    @Column(nullable = false, columnDefinition = "int unsigned default 1")
    private int type;
    /**
     * 链接
     */
    @Column(nullable = false)
    private String link;
    /**
     * 创建时间
     */
    @Column(nullable = false)
    @CreationTimestamp
    private Date gmtCreate;
    /**
     * 更新时间
     */
    @Column(nullable = false)
    @UpdateTimestamp
    private Date gmtModified;
}
