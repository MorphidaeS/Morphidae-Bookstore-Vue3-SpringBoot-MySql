package com.books.entity;

import com.books.repository.OrderRepository;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


@Data
@Entity(name = "mall_order")
public class Order implements Serializable {
    /**
     * 订单状态
     */
    public enum STATUS {
        /**
         * 0：订单已经被用户删除
         */
        DEL_BY_USER(0),
        /**
         * 1：已下单（待付款）
         */
        ORDERED(1),
        /**
         * 2：已付款（待发货）
         */
        BUY(2),
        /**
         * 3：已发货（待收货）
         */
        SHIP(3),
        /**
         * 4：已收货（待评价）
         */
        RECEIPT(4),
        /**
         * 5：已评价（完成订单）
         */
        EVALUATION(5),
        /**
         * 6：订单已经被商家删除
         */
        DEL_BY_ADMIN(6),
        /**
         * 7：订单已经被商家和用户同时删除
         */
        DEL_ALL(7);

        private final int status;

        STATUS(int status) {
            this.status = status;
        }

        public int getStatus() {
            return status;
        }
    }

    /**
     * 订单ID
     */
    @Id
    @GeneratedValue(generator = "idGenerator")
    @GenericGenerator(name = "idGenerator", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(length = 36, columnDefinition = "char(36)")
    private String id;
    /**
     * 订单对应用户
     */
    @SuppressWarnings("JpaDataSourceORMInspection")
    @ManyToOne(optional = false)
    @JoinColumn(name = "userId")
    private User user;
    /**
     * 订单对应商品
     */
    @SuppressWarnings("JpaDataSourceORMInspection")
    @ManyToOne(optional = false)
    @JoinColumn(name = "commodityId")
    private Commodity commodity;
    /**
     * 下单的商品数量
     */
    @Column(nullable = false, columnDefinition = "int unsigned default 1")
    private int countNum;
    /**
     * 总价
     */
    @Column(nullable = false, columnDefinition = "decimal(38,2)")
    private BigDecimal sumPrice;
    /**
     * <p>订单状态
     * <p>0：订单已经被用户删除
     * <p>1：已下单（待付款）
     * <p>2：已付款（待发货）
     * <p>3：已发货（待收货）
     * <p>4：已收货（待评价）
     * <p>5：已评价（完成订单）
     * <p>6：订单已经被商家删除
     * <p>7：订单已经被商家和用户同时删除
     */
    @Column(nullable = false, columnDefinition = "tinyint unsigned default 1")
    private int status;
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
