<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST"></c:set>

<script>
	const API_KEY = 'ZXk2DrDdVlzzp6UIrQbJGI9S8oFqBrn69AaP%2B9KV%2FTXdJ8RvZrCIAUKs%2BgUWClh7Vi8nNce5hXgrGncCf91pdA%3D%3D';
	
	async function getCData() {
		const url = 'https://openapi.price.go.kr/openApiImpl/ProductPriceInfoService/getProductInfoSvc.do?serviceKey='+ API_KEY;
		const response = await
		fetch(url);
		const data = await
		response.json();
		console.log("data", data);
	}
	getCData();

</script>

<%@ include file="../common/head.jspf"%>

<%@ include file="../common/foot.jspf"%>