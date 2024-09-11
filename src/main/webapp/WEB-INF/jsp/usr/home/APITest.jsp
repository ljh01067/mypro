<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST"></c:set>

<script>
function getCData() {
    const url = '/usr/home/getCData'; // 서버에서 프록시로 API 호출
    const xhr = new XMLHttpRequest();

    xhr.open("GET", url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const xmlResponse = xhr.responseText;
            console.log("XML Data:", xmlResponse);
            
            // 여기서 XML 파싱 및 처리를 수행
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(xmlResponse, "text/xml");
            
            const items = xmlDoc.getElementsByTagName('item');
            for (let i = 0; i < items.length; i++) {
            	const itemId = items[i].getElementsByTagName('goodId')[0].textContent;
                const itemName = items[i].getElementsByTagName('goodName')[0].textContent;
                console.log('Item Id /Item Name:',itemId, itemName);
            }
        }
    };
    xhr.send();
}

getCData();
</script>


<%@ include file="../common/head.jspf"%>

<%@ include file="../common/foot.jspf"%>