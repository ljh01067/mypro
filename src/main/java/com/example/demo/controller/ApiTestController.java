package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Controller
public class ApiTestController {
	@RequestMapping("/usr/home/APITest")
	public String showAPITest() {
		return "/usr/home/APITest";
	}
	
	public class OpenApi {
	    public static void main(String[] args) {
	        BufferedReader br = null;
	        try{            
	            String urlstr = "http://openapi.price.go.kr/openApiImpl/ProductPriceInfoService/getProductInfoSvc.do?serviceKey=ZXk2DrDdVlzzp6UIrQbJGI9S8oFqBrn69AaP%2B9KV%2FTXdJ8RvZrCIAUKs%2BgUWClh7Vi8nNce5hXgrGncCf91pdA%3D%3D";
	            URL url = new URL(urlstr);
	            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
	            urlconnection.setRequestMethod("GET");
	            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
	            String result = "";
	            String line;
	            while((line = br.readLine()) != null) {
	                result = result + line + "\n";
	            }
	            System.out.println(result);
	        }catch(Exception e){
	            System.out.println(e.getMessage());
	        }
	    }
	}
}
