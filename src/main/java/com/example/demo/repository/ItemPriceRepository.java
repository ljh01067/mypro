package com.example.demo.repository;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ItemPriceRepository {

    @Select("SELECT `name` FROM category")
    public List<String> findAllCategories();

    @Select("""
            SELECT d.name FROM category c
            INNER JOIN detailitem d ON c.id = d.categoryid
            WHERE c.`name` = #{category}
            """)
    public List<String> findDetailItemsByCategory(@Param("category") String category);


    @Select("""
            SELECT p.name FROM product p 
            INNER JOIN detailitem d ON p.detailid = d.detailid 
            WHERE d.name = #{detailItem}
            """)
    public List<String> findProductsByDetailItem(@Param("detailItem") String detailItem);
}