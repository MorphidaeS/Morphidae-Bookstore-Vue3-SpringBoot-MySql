package com.books.controller;

import com.books.dto.CommodityDTO;
import com.books.dto.LoginUser;
import com.books.dto.RestModel;
import com.books.security.MustAdminLogin;
import com.books.security.MustUserLogin;
import com.books.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;


@RestController
@RequestMapping("/commodity")
public class CommodityController {
    private final CommodityService commodityService;

    @Autowired
    public CommodityController(CommodityService commodityService) {
        this.commodityService = commodityService;
    }

    /**
     * 根据商品类别获取商品
     *
     * @param typeId   类别ID
     * @param pageable 分页
     * @return ResponseEntity
     */
    @GetMapping("/type")
    public ResponseEntity<?> findByType(@MustUserLogin LoginUser loginUser,
                                        @RequestParam String typeId,
                                        @PageableDefault(
                                                size = 20, sort = {"gmtModified"},
                                                direction = Sort.Direction.DESC
                                        )
                                                Pageable pageable) {
        return RestModel.ok(commodityService.findByType(typeId, pageable));
    }

    /**
     * 获取所有推荐商品
     *
     * @return ResponseEntity
     */
    @GetMapping("/recommends")
    public ResponseEntity<?> allRecommend() {
        return RestModel.ok(commodityService.findByRecommend());
    }

    /**
     * 获取一个商品
     *
     * @param id 商品ID
     * @return ResponseEntity
     */
    @GetMapping("/one/{id}")
    public ResponseEntity<?> getById(@MustUserLogin LoginUser loginUser,
                                     @PathVariable String id) {
        return RestModel.ok(commodityService.findById(id));
    }

    /**
     * 搜索商品
     *
     * @param loginUser 登录用户
     * @param keyword   关键字
     * @param pageable  分页
     * @return ResponseEntity
     */
    @GetMapping("/search/{keyword}")
    public ResponseEntity<?> search(@MustUserLogin LoginUser loginUser,
                                    @PathVariable String keyword,
                                    @PageableDefault(
                                            size = 20, sort = {"gmtModified"},
                                            direction = Sort.Direction.DESC
                                    )
                                            Pageable pageable) {
        return RestModel.ok(commodityService.search(keyword, pageable));
    }

    /**
     * 管理员获取所有商品
     *
     * @param loginUser 登录用户
     * @param pageable  分页
     * @return ResponseEntity
     */
    @GetMapping("/admin")
    public ResponseEntity<?> getAll(@MustAdminLogin LoginUser loginUser,
                                    @PageableDefault(
                                            size = 20, sort = {"gmtModified"},
                                            direction = Sort.Direction.DESC
                                    )
                                            Pageable pageable) {
        return RestModel.ok(commodityService.findAll(pageable));
    }

    /**
     * 修改商品信息
     *
     * @param loginUser 登录用户
     * @param commodity 商品
     * @return ResponseEntity
     */
    @PatchMapping("/admin")
    public ResponseEntity<?> modify(@MustAdminLogin LoginUser loginUser,
                                    @RequestBody CommodityDTO commodity) {
        commodityService.modify(commodity);
        return RestModel.noContent();
    }

    /**
     * 添加商品
     *
     * @param loginUser       登录用户
     * @param name            标题
     * @param price           价格
     * @param stock           库存
     * @param recommended     推荐商品
     * @param commodityTypeId 商品分类ID
     * @param imgMain         主图
     * @param imgSecond       副图
     * @param detail          商品详情
     * @return ResponseEntity
     */
    @PostMapping("/admin")
    public ResponseEntity<?> add(@MustAdminLogin LoginUser loginUser,
                                 @RequestParam String name,
                                 @RequestParam BigDecimal price,
                                 @RequestParam BigDecimal stock,
                                 @RequestParam boolean recommended,
                                 @RequestParam String commodityTypeId,
                                 @RequestParam String imgMain,
                                 @RequestParam String imgSecond,
                                 @RequestParam(required = false) String detail) {
        return RestModel.created(commodityService.add(name, price, stock.intValue(), recommended, commodityTypeId, imgMain, imgSecond, detail));
    }
}
