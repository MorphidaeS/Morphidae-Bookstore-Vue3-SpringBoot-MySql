package com.books.repository;

import com.books.entity.Commodity;
import com.books.entity.CommodityType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface CommodityRepository extends JpaRepository<Commodity, String> {
    /**
     * 根据商品分类获取商品
     *
     * @param commodityType 商品类别
     * @param takeOff       下架的商品？
     * @param pageable      分页
     * @return 商品集合
     */
    Page<Commodity> findAllByCommodityTypeAndTakeOff(CommodityType commodityType, boolean takeOff, Pageable pageable);

    /**
     * 更具是否推荐和是否下架获取商品
     *
     * @param recommended 推荐商品
     * @param takeOff     下架的商品？
     * @return 商品集合
     */
    List<Commodity> findAllByRecommendedAndTakeOff(boolean recommended, boolean takeOff);

    /**
     * 搜索商品
     *
     * @param takeOff  下架的商品？
     * @param nameLike 近似标题
     * @param pageable 分页
     * @return 商品集合
     */
    Page<Commodity> findAllByTakeOffAndNameLike(boolean takeOff, String nameLike, Pageable pageable);

    /**
     * 根据商品分类查询该分类下是否有商品
     *
     * @param commodityType 分类
     * @return 有返回<code>true</code>
     */
    boolean existsByCommodityType(CommodityType commodityType);

    /**
     * 查询所有商品
     *
     * @param takeOff  已下架？
     * @param pageable 分页
     * @return 商品集合
     */
    Page<Commodity> findAllByTakeOff(boolean takeOff, Pageable pageable);
}
