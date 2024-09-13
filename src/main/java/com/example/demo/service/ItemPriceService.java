package com.example.demo.service;

import com.example.demo.dto.ItemPriceResponse;
import com.example.demo.repository.ItemPriceRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ItemPriceService {
    
    private final ItemPriceRepository itemPriceRepository;

    @Autowired
    public ItemPriceService(ItemPriceRepository itemPriceRepository) {
        this.itemPriceRepository = itemPriceRepository;
    }
    
    public List<String> getBusiness() {
        return itemPriceRepository.findAllBusiness();
    }
    
    public List<String> getRegion() {
        return itemPriceRepository.findAllRegion();
    }

    public List<String> getCategories() {
        return itemPriceRepository.findAllCategories();
    }
    
    public List<String> getBusinessCodeName(String business) {
        return itemPriceRepository.findBusinessCodeName(business);
    }

    public List<String> getDetailItems(String category) {
        return itemPriceRepository.findDetailItemsByCategory(category);
    }
    
    public String findGoodsmlclscodeByDetailItem(String detailItem) {
        return itemPriceRepository.findGoodsmlclscodeByDetailId(detailItem);
    }
}