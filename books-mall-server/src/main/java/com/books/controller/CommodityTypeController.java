package com.books.controller;

import com.books.dto.LoginUser;
import com.books.dto.RestModel;
import com.books.entity.CommodityType;
import com.books.security.MustAdminLogin;
import com.books.service.CommodityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
public class CommodityTypeController {
    private final CommodityTypeService commodityTypeService;

    @Autowired
    public CommodityTypeController(CommodityTypeService commodityTypeService) {
        this.commodityTypeService = commodityTypeService;
    }

    /**
     * 获取所有商品分类
     *
     * @return ResponseEntity
     */
    @GetMapping("/commodity_types")
    public ResponseEntity<?> getAllCommodityType() {
        return RestModel.ok(commodityTypeService.getAll());
    }

    /**
     * 修改分类信息
     *
     * @param loginUser     登录用户
     * @param commodityType 分类信息
     * @return ResponseEntity
     */
    @PatchMapping("/commodity_type")
    public ResponseEntity<?> modifyCommodityType(@MustAdminLogin LoginUser loginUser,
                                                 @RequestBody CommodityType commodityType) {
        commodityTypeService.modifyCommodityType(commodityType);
        return RestModel.noContent();
    }

    /**
     * 删除分类
     *
     * @param loginUser 登录用户
     * @param id        分类ID
     * @return ResponseEntity
     */
    @DeleteMapping("/commodity_type/{id}")
    public ResponseEntity<?> delCommodityType(@MustAdminLogin LoginUser loginUser,
                                              @PathVariable String id) {
        commodityTypeService.delCommodityType(id);
        return RestModel.noContent();
    }

    /**
     * 新增分类
     *
     * @param loginUser 登录用户
     * @param name      分类名
     * @return ResponseEntity
     */
    @PostMapping("/commodity_type")
    public ResponseEntity<?> addCommodityType(@MustAdminLogin LoginUser loginUser,
                                              @RequestParam String name) {
        return RestModel.created(commodityTypeService.add(name));
    }
}
