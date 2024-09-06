package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
