package com.example.demo.controller;

import com.example.demo.dto.ItemPriceResponse;
import com.example.demo.service.ItemPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ItemPriceController {

    @Autowired
    private ItemPriceService itemPriceService;

    @GetMapping("/usr/home/api")
    public ItemPriceResponse getItemPrices(@RequestParam String goodId) {
        return itemPriceService.getItemPrices(goodId);
    }
}