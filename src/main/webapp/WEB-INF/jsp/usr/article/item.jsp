<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ITEM"></c:set>
<%@ include file="../common/head.jspf"%>
<script>
function updateStore() {
    const business = document.querySelectorAll("input[name='business']:checked");
    const region = document.getElementById("region").value;
    console.log(business);

    // 업소 선택 여부 확인
    if (business.length === 0) {
        alert("업소를 선택해 주세요.");
        return;
    }

    // 선택된 업소 값을 배열로 변환
    const businessValues = Array.from(business).map(input => input.value);

    // Ajax로 업소 코드 이름 가져오기
    $.ajax({
    url: `/usr/article/businesscodename`,
    type: 'GET',
    traditional: true,  // 배열을 전통적인 방식으로 직렬화
    data: { business: businessValues },
    success: function(businessCodeNames) {
    	console.log('업소 코드 이름들:', businessCodeNames);
            // XML 데이터 요청
            fetch('/usr/home/getSData')
                .then(response => response.text())
                .then(xmlResponse => {
                    const parser = new DOMParser();
                    const xmlDoc = parser.parseFromString(xmlResponse, "text/xml");

                    // XML 데이터에서 'iros.openapi.service.vo.entpInfoVO' 태그 찾기
                    const items = xmlDoc.getElementsByTagName('iros.openapi.service.vo.entpInfoVO');
                    const storeNames = [];

                    // XML 데이터에서 조건에 맞는 항목 필터링
                    Array.from(items).forEach(item => {
                        const entptypecode = item.getElementsByTagName('entpTypeCode')[0]?.textContent.trim();
                        const roadaddrbasic = item.getElementsByTagName('roadAddrBasic')[0]?.textContent.trim().split(' ')[0];

                        // 업소 코드와 지역 조건에 맞는 항목을 필터링
                        if (businessCodeNames.includes(entptypecode) && (region === '*' || roadaddrbasic === region)) {
                            const storeName = item.getElementsByTagName('entpName')[0]?.textContent.trim();
                            if (storeName) {
                                storeNames.push(storeName);
                            }
                        }
                    });

                    // 상점 목록을 갱신
                    const storeSelect = document.getElementById("store");
                    storeSelect.innerHTML = "<option value='' selected disabled>전체</option>";
                    storeNames.forEach(store => {
                        const option = document.createElement("option");
                        option.value = store;
                        option.textContent = store;
                        storeSelect.appendChild(option);
                    });
                })
                .catch(error => {
                    console.error('XML 데이터를 가져오는 중 오류 발생:', error);
                    alert('XML 데이터를 가져오는 데 실패했습니다. 나중에 다시 시도해 주세요.');
                });
        },
        error: function(xhr, status, error) {
            console.error('업소 코드를 가져오는 중 오류 발생:', error);
            alert('업소 코드를 가져오는 데 실패했습니다. 나중에 다시 시도해 주세요.');
        }
    });
}
function updateDetailItems() {
    const category = document.getElementById("category").value;
    const detailItemSelect = document.getElementById("detailItem");

    if (!category) {
        alert("품목을 선택해 주세요.");
        return;
    }

    $.ajax({
        url: `/usr/article/detailItems`,
        type: 'GET',
        data: { category: category },
        success: function(data) {
            if (Array.isArray(data)) {
                detailItemSelect.innerHTML = "<option value='' selected disabled>상세품목을 선택하세요</option>";
                data.forEach(item => {
                    const option = document.createElement("option");
                    option.value = item;
                    option.textContent = item;
                    detailItemSelect.appendChild(option);
                });
            } else {
                console.error('서버 응답이 배열이 아닙니다:', data);
            }
        },
        error: function(xhr, status, error) {
            console.error('상세 품목을 가져오는 중 오류 발생:', error);
            alert('상세 품목을 가져오는 데 실패했습니다. 나중에 다시 시도해 주세요.');
        }
    });
}

function updateProductOptions() {
    const detailItem = document.getElementById("detailItem").value;

    if (!detailItem) {
        alert("상세품목을 선택해 주세요.");
        return;
    }

    // 첫 번째 AJAX 호출: goodsmlclscode 가져오기
    $.ajax({
        url: `/usr/article/products`,
        type: 'GET',
        data: { detailItem: detailItem },
        success: function(goodsmlclscode) {

            // 두 번째 AJAX 호출: XML 데이터 가져오기
            fetch('/usr/home/getCData')
                .then(response => response.text())
                .then(xmlResponse => {
                   
                    const parser = new DOMParser();
                    const xmlDoc = parser.parseFromString(xmlResponse, "text/xml");
                    
                    const items = xmlDoc.getElementsByTagName('item');
                    const goodNames = []; // goodName을 저장할 배열

                    for (let i = 0; i < items.length; i++) {
                        const goodSmlclsCode = items[i].getElementsByTagName('goodSmlclsCode')[0].textContent;
                        if (goodSmlclsCode === '0'+goodsmlclscode) {
                            const itemName = items[i].getElementsByTagName('goodName')[0].textContent;
                            goodNames.push(itemName); // goodName을 배열에 추가
                        }
                    }

                    
                    // 상품 선택 목록 업데이트
                    const productSelect = document.getElementById("product");
                    productSelect.innerHTML = "<option value='' selected disabled>상품을 선택하세요</option>";
                    goodNames.forEach(name => {
                        const option = document.createElement("option");
                        option.value = name; // 선택 값으로 goodName을 설정
                        option.textContent = name; // 표시되는 텍스트로 goodName을 설정
                        productSelect.appendChild(option);
                    });
                })
                .catch(error => {
                    console.error('XML 데이터를 가져오는 중 오류 발생:', error);
                    alert('XML 데이터를 가져오는 데 실패했습니다. 나중에 다시 시도해 주세요.');
                });
        },
        error: function(xhr, status, error) {
            console.error('goodsmlclscode를 가져오는 중 오류 발생:', error);
            alert('goodsmlclscode를 가져오는 데 실패했습니다. 나중에 다시 시도해 주세요.');
        }
    });
}
</script>

<div class="ta-c">
    <div class="inline-block ta-c b-l-1 w-500">
        <div class="inline-block pd-0 mg-0 ta-c">
            <div class="inline-block w-75px pd-0 mg-0">업소</div>
            <div class="inline-block pd-0 mg-l--5 ta-c checkbox-item">
                <c:forEach var="business" items="${business}">
            <input type="checkbox" id="business-${business}" name="business" value="${business}" onchange="updateStore()">
            <label for="business-${business}">${business}</label>
    </c:forEach>
            </div>
        </div>
        <hr>
        <br>
        <div class="inline-block w-75px pd-0 mg-0">지역</div>
        <div class="inline-block w-150px pd-0 mg-l--5 ta-c m-b-25">
            <select name="region" id="region" onchange="updateStore()">
    <option value="*">전체</option>
    <c:forEach var="region" items="${region}">
        <option value="${region}">${region}</option>
    </c:forEach>
</select>
        </div>
        <div class="inline-block w-75px pd-0 mg-0">판매점</div>
        <div class="inline-block w-150px pd-0 mg-l--5 ta-c">
            <select name="store" id="store" style="vertical-align: middle;">
                    <option value="" selected disabled>전체</option>
                </select>
        </div>
        <hr>
        <br>
        <div class="inline-block pd-0 mg-0 ta-c">
            <div class="inline-block w-75px pd-0 mg-0" style="vertical-align: middle;">품목</div>
            <div class="inline-block pd-0 mg-l--5 ta-c m-b-25">
                <select name="category" id="category" onchange="updateDetailItems()">
    <option value="" selected disabled>품목을 선택하세요</option>
    <c:forEach var="category" items="${categories}">
        <option value="${category}">${category}</option>
    </c:forEach>
</select>
            </div>
            <div class="inline-block w-75px pd-0 mg-0" style="vertical-align: middle;">상세품목</div>
            <div class="inline-block pd-0 mg-l--5 ta-c">
                <select name="detailItem" id="detailItem" onchange="updateProductOptions()" style="vertical-align: middle;">
                    <option value="" selected disabled>상세품목을 선택하세요</option>
                </select>
            </div>
            <hr class="w-500px">
            <br>
            <div class="inline-block w-75px pd-0 mg-0" style="vertical-align: middle;">상품</div>
            <div class="inline-block w-400px pd-0 mg-l--5 ta-c m-b-25">
                <select name="product" id="product" style="vertical-align: middle;">
                    <option value="" selected disabled>상품을 선택하세요</option>
                </select>
            </div>
        </div>
    </div>
</div>
<div class="ta-c">
<br>
<button class="w-500 b-l-1">조회하기</button>
</div>

    <style>
    hr { border-top:1px solid #9C9C9C;
    border-bottom:1px solid #F6F6F6;
    }
    body{
    position:flex;
    justify-content: center;
    align-items: center;
    margin: 0;
    padding: 0;
    }
    .block{
    display:block;
    }
    .inline-block{
    display:inline-block;
    }
    .w-75px{
    width:75px;
    }
    .w-100px{
    width:100px;
    }
    .w-140px{
    width:140px;
    }
    .w-150px{
    width:145px;
    }
    .w-400px{
    width:398px;
    }
    .w-500px{
    width:500px;
    }
    .bg-red{
    background-color: red;
    }
    .bg-blue{
    background-color: blue;
    }
    .bg-gold{
    background-color: gold;
    }
    .pd-0{
    padding:0;
    }
    .mg-0{
    margin:0;
    }
    .mg-l--5{
    margin-left:-5px;
    }
    .ta-c{
    text-align:center;
    }
    .po-ab{
    position:absolute;
    }
    .left-0{
    left:0;
    }
    .right-0{
    right:0;
    }
    .b-l-1{
    border:1px solid;
    }
    .w-500{
    width:500px;
    }
    .w-100%{
    width:100%;
    }
    .m-b-25{
    margin-bottom:25px;
    }
    </style>
<%@ include file="../common/foot.jspf"%>