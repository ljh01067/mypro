package com.example.demo.service;

import com.example.demo.dto.ItemPriceResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ItemPriceService {

    @Value("${api.base-url}")
    private String baseUrl;

    @Value("${api.service-key}")
    private String serviceKey;

    private final RestTemplate restTemplate;

    public ItemPriceService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public ItemPriceResponse getItemPrices(String goodId) {
        String url = String.format("%s?goodId=%s&serviceKey=%s", baseUrl, goodId, serviceKey);

        try {
            return restTemplate.getForObject(url, ItemPriceResponse.class);
        } catch (Exception e) {
            e.printStackTrace(); // 로그에 오류를 기록
            throw e; // 예외를 다시 던져서 컨트롤러에서 처리할 수 있게 함
        }
    }
}