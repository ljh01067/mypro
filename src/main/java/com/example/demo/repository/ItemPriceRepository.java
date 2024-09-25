package com.example.demo.repository;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ItemPriceRepository {
	
	@Select("SELECT `name` FROM business")
    public List<String> findAllBusiness();
	
	@Select("SELECT `name` FROM region")
    public List<String> findAllRegion();

    @Select("SELECT `name` FROM category")
    public List<String> findAllCategories();

    @Select({
        "<script>",
        "SELECT b.codeName",
        "FROM business b",
        "WHERE b.name IN",
        "<foreach item='item' collection='business' open='(' separator=',' close=')'>",
        "#{item}",
        "</foreach>",
        "</script>"
    })
    public List<String> findBusinessCodeName(@Param("business") List<String> business);
    
    @Select("""
            SELECT d.name FROM category c
            INNER JOIN detailitem d ON c.id = d.categoryid
            WHERE c.`name` = #{category}
            """)
    public List<String> findDetailItemsByCategory(@Param("category") String category);

    @Select("""
            SELECT d.goodSmlclsCode FROM detailitem d WHERE d.name = #{detailItem};
            """)
    public String findGoodsmlclscodeByDetailId(@Param("detailItem") String detailItem);

}