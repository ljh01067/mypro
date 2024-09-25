package com.example.demo.controller;

import com.example.demo.service.ItemPriceService;
import com.example.demo.vo.ItemPrice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/usr/article")
public class ItemPriceController {

    @Autowired
    private ItemPriceService itemPriceService;
    
    @GetMapping("/item")
    public String showItemPage(Model model) {
        List<String> categories = itemPriceService.getCategories();
        model.addAttribute("categories", categories);
        List<String> business = itemPriceService.getBusiness(); 
        model.addAttribute("business", business);
        List<String> region = itemPriceService.getRegion(); 
        model.addAttribute("region", region);
        return "/usr/article/item"; // JSP 페이지 이름
    }
    @GetMapping("/cart")
    public String showCartPage(Model model) {
        List<String> categories = itemPriceService.getCategories();
        model.addAttribute("categories", categories);
        List<String> business = itemPriceService.getBusiness(); 
        model.addAttribute("business", business);
        List<String> region = itemPriceService.getRegion(); 
        model.addAttribute("region", region);
        return "/usr/article/cart"; // JSP 페이지 이름
    }
    @GetMapping("/discount")
    public String showDiscountPage(Model model) {
        List<String> categories = itemPriceService.getCategories();
        model.addAttribute("categories", categories);
        List<String> business = itemPriceService.getBusiness(); 
        model.addAttribute("business", business);
        List<String> region = itemPriceService.getRegion(); 
        model.addAttribute("region", region);
        return "/usr/article/discount"; // JSP 페이지 이름
    }
    @GetMapping("/detailItems")
    @ResponseBody
    public List<String> getDetailItems(@RequestParam(name = "category") String category) {
    	System.out.println("category: " + category);
        if (category == null || category.trim().isEmpty()) {
            // 빈 문자열에 대한 예외 처리
            throw new IllegalArgumentException("Category must not be empty");
        }
        try {
            List<String> detailItems = itemPriceService.getDetailItems(category);
            System.out.println("Detail Items: " + detailItems);
            return detailItems;
        } catch (Exception e) {
            // 예외 처리 및 로그 기록
            e.printStackTrace();
            throw new RuntimeException("서버 오류가 발생했습니다. 나중에 다시 시도해 주세요.");
        }
    }
    @GetMapping("/businesscodename")
    @ResponseBody
    public List<String> getBusinessCodeName(@RequestParam(name = "business") List<String> business) {
        System.out.println("business: " + business);
        if (business == null || business.isEmpty()) {
            // 빈 문자열에 대한 예외 처리
            throw new IllegalArgumentException("Business must not be empty");
        }
        try {
            List<String> businessCodeNames = itemPriceService.getBusinessCodeName(business);
            System.out.println("Business Code Names: " + businessCodeNames);
            return businessCodeNames;
        } catch (Exception e) {
            // 예외 처리 및 로그 기록
            e.printStackTrace();
            throw new RuntimeException("서버 오류가 발생했습니다. 나중에 다시 시도해 주세요.");
        }
    }

    @GetMapping("/products")
    @ResponseBody
    public String getProductsByDetailId(@RequestParam("detailItem") String detailItem) {
  
        String goodsmlclscode = itemPriceService.findGoodsmlclscodeByDetailItem(detailItem);
        System.out.println("goodsmlclscode: " + goodsmlclscode);

        return goodsmlclscode;
    }

    @GetMapping("/categories")
    @ResponseBody
    public List<String> getCategories() {
        return itemPriceService.getCategories();
    }
    
    @GetMapping("/business")
    @ResponseBody
    public List<String> getBusiness() {
        return itemPriceService.getBusiness();
    }
    
    @GetMapping("/region")
    @ResponseBody
    public List<String> getRegion() {
        return itemPriceService.getRegion();
    }
    @GetMapping("/itemlist")
    @ResponseBody
    public List<String> getItemList() {
        return itemPriceService.getRegion();
    }
}