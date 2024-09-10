package com.example.demo.controller;

import com.example.demo.service.ItemPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
        return "/usr/article/item"; // JSP 페이지 이름
    }
    @GetMapping("/detailItems")
    @ResponseBody
    public List<String> getDetailItems(@RequestParam String category) {
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

    @GetMapping("/products")
    @ResponseBody
    public List<String> getProducts(@RequestParam String detailItem) {
        List<String> products = itemPriceService.getProducts(detailItem);
        System.out.println("Products: " + products);
        return products;  // 반드시 List<String>을 반환
    }

    @GetMapping("/categories")
    @ResponseBody
    public List<String> getCategories() {
        return itemPriceService.getCategories();
    }
}