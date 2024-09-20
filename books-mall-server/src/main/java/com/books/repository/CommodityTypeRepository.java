package com.books.repository;

import com.books.entity.CommodityType;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CommodityTypeRepository extends JpaRepository<CommodityType, String> {
}
