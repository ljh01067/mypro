<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ITEM"></c:set>
<%@ include file="../common/head.jspf"%>
<script>
function updateDetailItems() {
    const category = document.getElementById("category").value;
    const detailItemSelect = document.getElementById("detailItem");

    const encodedCategory = encodeURIComponent(category);

    fetch(`/usr/article/detailItems?category=${encodedCategory}`)
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
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
    })
    .catch(error => {
        console.error('상세 품목을 가져오는 중 오류 발생:', error);
        alert('상세 품목을 가져오는 데 실패했습니다. 나중에 다시 시도해 주세요.');
    });
}

function updateProductOptions() {
    const detailItem = document.getElementById("detailItem").value;
    const productSelect = document.getElementById("product");

    fetch(`/usr/article/products?detailItem=${detailItem}`)
        .then(response => response.json())
        .then(data => {
            if (Array.isArray(data)) { // data가 배열인지 확인
                productSelect.innerHTML = "<option value='' selected disabled>상품을 선택하세요</option>";
                data.forEach(item => {
                    const option = document.createElement("option");
                    option.value = item;
                    option.textContent = item;
                    productSelect.appendChild(option);
                });
            } else {
                console.error('서버 응답이 배열이 아닙니다:', data);
            }
        })
        .catch(error => {
            console.error('상품을 가져오는 중 오류 발생:', error);
            alert('상품을 가져오는 데 실패했습니다. 나중에 다시 시도해 주세요.');
        });
}
</script>

<div class="ta-c">
    <div class="inline-block ta-c b-l-1 w-500">
        <div class="inline-block pd-0 mg-0 ta-c">
            <div class="inline-block w-75px pd-0 mg-0">업소</div>
            <div class="inline-block pd-0 mg-l--5 ta-c">
                <label>
                    <input type="checkbox">
                    <span>대형마트</span>
                </label>
                <label>
                    <input type="checkbox">
                    <span>백화점</span>
                </label>
                <label>
                    <input type="checkbox">
                    <span>슈퍼마켓</span>
                </label>
                <label>
                    <input type="checkbox">
                    <span>전통시장</span>
                </label>
                <label>
                    <input type="checkbox">
                    <span>편의점</span>
                </label>
            </div>
        </div>
        <hr>
        <br>
        <div class="inline-block w-75px pd-0 mg-0">지역</div>
        <div class="inline-block w-150px pd-0 mg-l--5 ta-c m-b-25">
            <select name="" id="">
                <option value="1">전체</option>
                <option value="2">서울특별시</option>
                <option value="3">부산광역시</option>
                <option value="4">대구광역시</option>
                <option value="5">대전광역시</option>
                <option value="6">광주광역시</option>
                <option value="7">울산광역시</option>
                <option value="8">인천광역시</option>
                <option value="9">강원특별자치도</option>
                <option value="10">경기도</option>
                <option value="11">경상남도</option>
                <option value="12">경상북도</option>
                <option value="13">전라남도</option>
                <option value="14">전북특별자치도</option>
                <option value="15">충청남도</option>
                <option value="16">충청북도</option>
                <option value="17">제주특별자치도</option>
                <option value="18">세종특별자치시</option>
            </select>
        </div>
        <div class="inline-block w-75px pd-0 mg-0">판매점</div>
        <div class="inline-block w-150px pd-0 mg-l--5 ta-c">
            <select name="" id="">
                <option value="1">전체</option>
                <option value="2">대형마트</option>
                <option value="3">백화점</option>
                <option value="4">슈퍼마켓</option>
                <option value="5">전통시장</option>
                <option value="6">편의점</option>
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