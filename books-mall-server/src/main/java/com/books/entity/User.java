package com.books.entity;

import com.books.repository.UserRepository;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Data
@Entity(name = "mall_user")
public class User implements Serializable {
    /**
     * 用户名（唯一）
     */
    @Id
    private String username;
    /**
     * 密码
     */
    @Column(nullable = false)
    private String password;
    /**
     * 邮箱（唯一）
     */
    @Column(nullable = false, unique = true)
    private String email;
    /**
     * 电话
     */
    @Column(nullable = false)
    private String tel;
    /**
     * 收货地址
     */
    @Column(columnDefinition = "text")
    private String address;
    /**
     * 所属角色
     */
    @SuppressWarnings("JpaDataSourceORMInspection")
    @ManyToOne(optional = false)
    @JoinColumn(name = "roleId")
    private Role role;
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
