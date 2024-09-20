package com.books.service.impl;

import com.books.entity.Commodity;
import com.books.entity.CommodityDetail;
import com.books.exception.IdNotFoundException;
import com.books.exception.NullFiledException;
import com.books.repository.CommodityDetailRepository;
import com.books.service.CommodityDetailService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(rollbackFor = Exception.class)
public class CommodityDetailServiceImpl implements CommodityDetailService {
    private final CommodityDetailRepository commodityDetailRepository;

    @Autowired
    public CommodityDetailServiceImpl(CommodityDetailRepository commodityDetailRepository) {
        this.commodityDetailRepository = commodityDetailRepository;
    }

    @Override
    public CommodityDetail findByCommodityId(String commodityId) {
        Commodity commodity = new Commodity();
        commodity.setId(commodityId);
        return commodityDetailRepository.findByCommodity(commodity).orElse(new CommodityDetail());
    }

    @Override
    public void modifyOrAdd(CommodityDetail commodityDetail) {
        if (StringUtils.isBlank(commodityDetail.getId())) {
            if (null == commodityDetail.getCommodity() || StringUtils.isBlank(commodityDetail.getCommodity().getId())) {
                throw new NullFiledException("商品ID为空");
            } else {
                Commodity commodity = new Commodity();
                commodity.setId(commodityDetail.getCommodity().getId());

                CommodityDetail newCommodityDetail = new CommodityDetail();
                newCommodityDetail.setCommodity(commodity);
                newCommodityDetail.setDetail(commodityDetail.getDetail());

                commodityDetailRepository.save(newCommodityDetail);
            }
        } else {
            CommodityDetail saved = commodityDetailRepository.findById(commodityDetail.getId()).orElseThrow(() -> new IdNotFoundException("详情ID不存在"));
            saved.setDetail(commodityDetail.getDetail());
            commodityDetailRepository.save(saved);
        }
    }
}
