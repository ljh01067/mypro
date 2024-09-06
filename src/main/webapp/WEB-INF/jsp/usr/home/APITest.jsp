<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="APITEST"></c:set>

<script>
const API_KEY = encodeURIComponent('llvpYURxInBanHczUcjI2GEOqjse7+XuXJfxblF4qKvO8E/w56ir7k1Zg2e20G3ruc481lscs4BBENSPtEJBug==');

async function getCData() {
    const url = 'http://openapi.price.go.kr/openApiImpl/ProductPriceInfoService/getProductInfoSvc.do?serviceKey=' + API_KEY;
    
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error('Network response was not ok: ' + response.statusText);
        }
        const textData = await response.text();
        
        // XML 파싱
        const parser = new DOMParser();
        const xmlData = parser.parseFromString(textData, "application/xml");
        
        console.log("Parsed XML Data:", xmlData);
        
        // XML 데이터에서 필요한 정보를 추출
        const productName = xmlData.querySelector("itemName")?.textContent || "Item not found";
        console.log("Product Name:", productName);
        
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}

getCData();
</script>


<%@ include file="../common/head.jspf"%>

<%@ include file="../common/foot.jspf"%>