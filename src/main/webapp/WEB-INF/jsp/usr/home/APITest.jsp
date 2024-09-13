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
            	const goodSmlclsCode = items[i].getElementsByTagName('goodSmlclsCode')[0].textContent;
            	if(goodSmlclsCode == '030201021'){
            	 const itemId = items[i].getElementsByTagName('goodId')[0].textContent;
                 const itemName = items[i].getElementsByTagName('goodName')[0].textContent;
                 console.log('Item Id /Item Name:',itemId, itemName);
            	}
            }
        }
    };
    xhr.send();
}

getCData();
</script>
<script>
function getSData() {
    const url = '/usr/home/getSData';
    const xhr = new XMLHttpRequest();

    xhr.open("GET", url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const xmlResponse = xhr.responseText;
            console.log("XML Data:", xmlResponse);
            
            // XML 파싱
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(xmlResponse, "text/xml");
            
            // XML 문서의 전체 구조 확인
            console.log("XML Document:", xmlDoc.documentElement.innerHTML);

            // XML 데이터에서 'iros.openapi.service.vo.entpInfoVO' 태그 찾기
            const items = xmlDoc.getElementsByTagName('iros.openapi.service.vo.entpInfoVO');
            console.log("Items:", items);

            // XML 데이터에서 필드를 추출하여 처리
            if (items.length > 0) {
                Array.from(items).forEach(item => {
                    const entpId = item.getElementsByTagName('entpId')[0]?.textContent.trim();
                    const entpName = item.getElementsByTagName('entpName')[0]?.textContent.trim();
                    const roadAddrBasic = item.getElementsByTagName('roadAddrBasic')[0]?.textContent.trim();

                    console.log("EntpId:", entpId);
                    console.log("EntpName:", entpName);
                    console.log("RoadAddrBasic:", roadAddrBasic);

                    // 필요한 정보를 사용하여 추가 처리
                });
            }
        }
    };
    xhr.send();
}

// 함수를 호출하는 부분
getSData();
</script>


<%@ include file="../common/head.jspf"%>

<%@ include file="../common/foot.jspf"%>