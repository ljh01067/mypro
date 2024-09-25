package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.ItemPriceResponse;
import com.example.demo.service.ItemPriceService;

@Controller
public class ArticleController {
	@RequestMapping("/usr/article/item")
	public String showItem() {
		return "/usr/article/item";
	}
	@RequestMapping("/usr/article/cart")
	public String showCart() {
		return "/usr/article/cart";
	}
	@RequestMapping("/usr/article/discount")
	public String showDiscount() {
		return "/usr/article/discount";
	}	

}