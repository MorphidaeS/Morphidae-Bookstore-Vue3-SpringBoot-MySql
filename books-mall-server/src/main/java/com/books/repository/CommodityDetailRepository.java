package com.books.repository;

import com.books.entity.Commodity;
import com.books.entity.CommodityDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;


public interface CommodityDetailRepository extends JpaRepository<CommodityDetail, String> {
    /**
     * 根据商品ID获取商品详情
     *
     * @param commodity 商品
     * @return 商品详情
     */
    Optional<CommodityDetail> findByCommodity(Commodity commodity);
}
