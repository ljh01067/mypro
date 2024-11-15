<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="DISCOUNT"></c:set>
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
<script>
function fetchItemList() {
    const store = document.getElementById("store").value;
    const product = document.getElementById("product").value;
    const goodInspectDay = "20220805"; // 고정된 값 또는 필요한 경우 동적으로 설정
    
    console.log(store);

    if (!store || !product) {
        alert("모든 항목을 선택해 주세요.");
        return;
    }

    let entpId, goodId;

    // 첫 번째 요청: /usr/home/getSData에서 store에 해당하는 entpId 가져오기
    fetchXMLData('/usr/home/getSData', (xmlDoc) => {
        entpId = getStoreIdFromXML(xmlDoc, store);
        if (entpId) {
            // 두 번째 요청: /usr/home/getCData에서 product에 해당하는 goodId 가져오기
            fetchXMLData('/usr/home/getCData', (xmlDoc) => {
                goodId = getProductIdFromXML(xmlDoc, product);
                if (goodId) {
                    // 세 번째 요청: /usr/home/getPData에서 가격 가져오기
                    fetchXMLDataWithParams('/usr/home/getPData', { entpId, goodId, goodInspectDay }, (xmlDoc) => {
                        const prices = getPricesFromXML(xmlDoc, goodId, entpId);
                        if (prices.length > 0) {
                            updatePriceTable(prices);
                        } else {
                            console.log("가격을 찾을 수 없음");
                            alert("해당 상품의 가격을 찾을 수 없습니다.");
                        }
                    });
                } else {
                    console.log("상품 ID를 찾을 수 없음");
                    alert("해당 상품의 ID를 찾을 수 없습니다.");
                }
            });
        } else {
            console.log("상점 ID를 찾을 수 없음");
            alert("해당 상점의 ID를 찾을 수 없습니다.");
        }
    });
}

function updatePriceTable(prices) {
    const tableBody = document.querySelector("#priceDisplay table tbody");
    tableBody.innerHTML = ""; // 기존 내용을 지우고 새 데이터를 추가

    prices.forEach(price => {
        const row = document.createElement("tr");

        const goodIdCell = document.createElement("td");
        goodIdCell.style.textAlign = "center";
        goodIdCell.textContent = price.goodId;
        row.appendChild(goodIdCell);

        const storeCell = document.createElement("td");
        storeCell.style.textAlign = "center";
        storeCell.textContent = price.entpId;
        row.appendChild(storeCell);
        
        const productCell = document.createElement("td");
        productCell.style.textAlign = "center";
        productCell.textContent = price.product;
        row.appendChild(productCell);

        const priceCell = document.createElement("td");
        priceCell.style.textAlign = "center";
        priceCell.textContent = price.price + " 원";
        row.appendChild(priceCell);

        tableBody.appendChild(row);
    });
}

function fetchXMLData(url, callback) {
    console.log("Fetching URL:", url);
    fetch(url)
        .then(response => response.text())
        .then(xmlResponse => {
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(xmlResponse, "text/xml");
            console.log("Fetched Data:", xmlResponse); // 서버에서 받아온 XML 데이터 확인
            callback(xmlDoc);
        })
        .catch(error => {
            console.error('XML 데이터를 가져오는 중 오류 발생:', error);
            alert('XML 데이터를 가져오는 데 실패했습니다.');
        });
}

function fetchXMLDataWithParams(url, params, callback) {
    console.log("Fetching URL with Params:", url, params);
    const queryString = new URLSearchParams(params).toString();
    const finalUrl = url + `?` + queryString;
    console.log("Final URL:", finalUrl);
    fetch(url + `?` + queryString)
        .then(response => response.text())
        .then(xmlResponse => {
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(xmlResponse, "text/xml");
            console.log("Fetched Data:", xmlResponse); // 서버에서 받아온 XML 데이터 확인
            callback(xmlDoc);
        })
        .catch(error => {
            console.error('XML 데이터를 가져오는 중 오류 발생:', error);
            alert('XML 데이터를 가져오는 데 실패했습니다.');
        });
}

function getStoreIdFromXML(xmlDoc, store) {
    console.log("Parsing Store XML");
    const items = xmlDoc.getElementsByTagName('iros.openapi.service.vo.entpInfoVO');
    for (let i = 0; i < items.length; i++) {
        const entpName = items[i].getElementsByTagName('entpName')[0].textContent;
        console.log("entpName:", entpName); // 상점 이름 확인
        if (store === entpName) {
            const entpId = items[i].getElementsByTagName('entpId')[0].textContent;
            console.log("Matched entpId:", entpId); // 매칭된 상점 ID 확인
            return entpId;
        }
    }
    return null;
}

function getProductIdFromXML(xmlDoc, product) {
    console.log("Parsing Product XML");
    const items = xmlDoc.getElementsByTagName('item');
    for (let i = 0; i < items.length; i++) {
        const goodName = items[i].getElementsByTagName('goodName')[0].textContent;
        console.log("goodName:", goodName); // 상품 이름 확인
        if (product === goodName) {
            const goodId = items[i].getElementsByTagName('goodId')[0].textContent;
            console.log("Matched goodId:", goodId); // 매칭된 상품 ID 확인
            return goodId;
        }
    }
    return null;
}

function getPricesFromXML(xmlDoc, goodId, entpId, returnMultiple = true) {
    console.log("Parsing Price XML");

    // xmlDoc이 null인지 확인
    if (!xmlDoc) {
        console.error("xmlDoc is null or undefined.");
        return returnMultiple ? [] : null;
    }
    if (!xmlDoc.documentElement) {
        console.error("XML Document is not available or invalid.");
        return returnMultiple ? [] : null;
    }
    console.log(xmlDoc.documentElement);

    // XML 응답을 문자열로 변환하여 출력
    const serializer = new XMLSerializer();
    try {
        const xmlString = serializer.serializeToString(xmlDoc);
        console.log("XML Document:", xmlString);
    } catch (error) {
        console.error("Error serializing XML document:", error);
        return returnMultiple ? [] : null;
    }

    const items = xmlDoc.getElementsByTagName('iros.openapi.service.vo.goodPriceVO');
    console.log("Number of items found:", items.length);

    // 여러 개의 가격을 저장할 배열
    const prices = [];

    for (let i = 0; i < items.length; i++) {
        const itemGoodIdElement = items[i].getElementsByTagName('goodId')[0];
        const itemEntpIdElement = items[i].getElementsByTagName('entpId')[0];
        const itemGoodPriceElement = items[i].getElementsByTagName('goodPrice')[0];
        const itemGoodDcYnElement = items[i].getElementsByTagName('goodDcYn')[0];

        const itemGoodId = itemGoodIdElement ? itemGoodIdElement.textContent.trim() : null;
        const itemEntpId = itemEntpIdElement ? itemEntpIdElement.textContent.trim() : null;
        const itemGoodPrice = itemGoodPriceElement ? itemGoodPriceElement.textContent.trim() : null;
        const itemGoodDcYn = itemGoodDcYnElement ? itemGoodDcYnElement.textContent.trim() : null;
        
        const store = document.getElementById("store").value;
        const region = document.getElementById("region").value;
        const product = document.getElementById("product").value;


        if (itemGoodId === goodId && itemEntpId === entpId && itemGoodDcYn === 'Y') {
            if (!returnMultiple) {
                console.log("Matched Price:", itemGoodPrice);
                return itemGoodPrice;
            }
            prices.push({
                goodId: region,
                entpId: store,
                product: product,
                price: itemGoodPrice
            });
        }
    }

    if (returnMultiple) {
        console.log("Matched Prices:", prices);
        return prices;
    } else {
        console.log("가격을 찾을 수 없음");
        return null;
    }
}

</script>
<div class="w-100%">
<div class="inline-block w-1200px">
<div class="fs-20px ta-l">
<div class="w-200px ta-c">
생필품 할인정보
</div>
</div>
<br>
<div class="w-1200px">
    <div class="inline-block ta-c b-l-1 w-1200px border-radius">
        <div class="inline-block pd-0 mg-0 w-1200px ta-l">
            <div class="inline-block w-100px pd-0 mg-0 ta-c">업소</div>
            <div class="inline-block pd-0 mg-l--5 ta-c checkbox-item">
                <c:forEach var="business" items="${business}">
            <input type="checkbox" id="business-${business}" name="business" value="${business}" onchange="updateStore()">
            <label for="business-${business}">${business}</label>
    </c:forEach>
            </div>
        </div>
        <hr>
        <br>
        <div class="w-1200px ta-l">
        <div class="inline-block w-100px ta-c pd-0 mg-0">지역</div>
        <div class="inline-block w-500px pd-0 mg-l--5 ta-c m-b-25">
            <select name="region" id="region" onchange="updateStore()">
    <option value="*">전체</option>
    <c:forEach var="region" items="${region}">
        <option value="${region}">${region}</option>
    </c:forEach>
</select>
        </div>
        <div class="inline-block w-100px pd-0 mg-0">판매점</div>
        <div class="inline-block w-500px pd-0 mg-l--5 ta-c">
            <select name="store" id="store" style="vertical-align: middle;">
                    <option value="" selected disabled>전체</option>
                </select>
        </div>
        </div>
        <hr>
        <br>
        <div class="inline-block pd-0 mg-0 ta-l">
            <div class="inline-block w-100px ta-c pd-0 mg-0" style="vertical-align: middle;">품목</div>
            <div class="inline-block w-500px pd-0 mg-l--5 ta-c m-b-25">
                <select name="category" id="category" onchange="updateDetailItems()">
    <option value="" selected disabled>품목을 선택하세요</option>
    <c:forEach var="category" items="${categories}">
        <option value="${category}">${category}</option>
    </c:forEach>
</select>
            </div>
            <div class="inline-block w-100px pd-0 mg-0" style="vertical-align: middle;">상세품목</div>
            <div class="inline-block w-500px pd-0 mg-l--5 ta-c">
                <select name="detailItem" id="detailItem" onchange="updateProductOptions()" style="vertical-align: middle;">
                    <option value="" selected disabled>상세품목을 선택하세요</option>
                </select>
            </div>
            <hr class="w-1200px">
            <br>
            <div class="inline-block ta-c w-100px pd-0 mg-0" style="vertical-align: middle;">상품</div>
            <div class="inline-block w-1100px pd-0 mg-l--5 ta-c m-b-25">
                <select name="product" id="product" style="vertical-align: middle;">
                    <option value="" selected disabled>상품을 선택하세요</option>
                </select>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<!-- 조회하기 버튼 -->
<div class="ta-c">
    <br>
    <button class="w-500 b-l-1 border-radius" onclick="fetchItemList()">조회하기</button>
    <div id="priceDisplay">
        <table border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr>
                    <th style="text-align: center;">지역</th>
                    <th style="text-align: center;">판매점</th>
                    <th style="text-align: center;">제품명</th>
                    <th style="text-align: center;">할인가격</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="price" items="${prices}">
                    <tr>
                        <td style="text-align: center;">${price.goodId}</td>
                        <td style="text-align: center;">${price.entpId}</td>
                        <td style="text-align: center;">${price.product}</td>
                        <td style="text-align: center;">${price.price} 원</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
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
    text-align:center;
    }
    .block{
    display:block;
    }
    .inline-block{
    display:inline-block;
    }
    .w-100%{
    width:100%;
    }
    .w-50px{
    width:50px;
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
    .w-200px{
    width:200px;
    }
    .w-400px{
    width:398px;
    }
    .w-500px{
    width:496px;
    }
    .w-1100px{
    width:1098px;
    }
    .w-1200px{
    width:1200px;
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
    .mg-l-100{
    margin-left:100px;
    }
    .mg-l--5{
    margin-left:-5px;
    }
    .ta-c{
    text-align:center;
    }
    .ta-l{
  text-align: left;
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
    .fs-20px{
    font-size:20px;
    }
    .border-radius{
    border-radius: 10px;
    }
    </style>
<%@ include file="../common/foot.jspf"%>