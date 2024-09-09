<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ITEM"></c:set>
<%@ include file="../common/head.jspf"%>
<script>
const detailOptions = {
        "grain": ["쌀", "밀가루", "보리"],
        "meat": ["소고기", "돼지고기", "닭고기"],
        "seafood": ["참치", "고등어", "오징어"],
        "dairy": ["우유", "치즈", "버터"],
        "condiments": ["간장", "고추장", "된장"],
        "vegetable": ["상추", "배추", "당근"],
        "snacks": ["초콜릿", "쿠키", "아이스크림"],
        "beverages": ["녹차", "커피", "맥주"],
        "beauty": ["샴푸", "비누", "화장품"],
        "household": ["세탁세제", "주방세제", "화장지"],
        "fish": ["고등어", "연어", "갈치"],
        "processed_food": ["통조림", "라면", "즉석밥"],
        "grains": ["쌀", "보리", "옥수수"]
    };

    const productOptions = {
        "쌀": ["일반쌀", "유기농쌀"],
        "밀가루": ["강력분", "중력분"],
        "보리": ["찰보리", "일반보리"],
        "소고기": ["한우", "수입산"],
        "돼지고기": ["삼겹살", "목살"],
        "닭고기": ["닭가슴살", "닭다리"],
        // 나머지 상세품목에 대한 상품 옵션 추가
    };

    function updateDetailItems() {
        const category = document.getElementById("category").value;
        const detailItemSelect = document.getElementById("detailItem");

        detailItemSelect.innerHTML = "<option value='' selected disabled>상세품목을 선택하세요</option>";

        if (category && detailOptions[category]) {
            detailOptions[category].forEach(item => {
                const option = document.createElement("option");
                option.value = item;
                option.textContent = item;
                detailItemSelect.appendChild(option);
            });
        }
    }

    function updateProductOptions() {
        const detailItem = document.getElementById("detailItem").value;
        const productSelect = document.getElementById("product");

        productSelect.innerHTML = "<option value='' selected disabled>상품을 선택하세요</option>";

        if (detailItem && productOptions[detailItem]) {
            productOptions[detailItem].forEach(item => {
                const option = document.createElement("option");
                option.value = item;
                option.textContent = item;
                productSelect.appendChild(option);
            });
        }
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
<div class="inline-block w-150px pd-0 mg-l--5 ta-c">
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
        <div class="inline-block pd-0 mg-l--5 ta-c">
            <select name="category" id="category" onchange="updateDetailItems()" style="vertical-align: middle;">
                <option value="" selected disabled>품목을 선택하세요</option>
                <option value="grain">곡물가공품</option>
                <option value="meat">정육·난류</option>
                <option value="seafood">수산가공품</option>
                <option value="dairy">낙농·축산가공품</option>
                <option value="condiments">조미료·장류·식용유</option>
                <option value="vegetable">채소</option>
                <option value="snacks">과자·빙과류</option>
                <option value="beverages">차·음료·주류</option>
                <option value="beauty">미용품</option>
                <option value="household">세탁·주방·가사용품</option>
                <option value="fish">생선류</option>
                <option value="processed_food">기타 가공식품</option>
                <option value="grains">곡물</option>
            </select>
        </div>
        <div class="inline-block w-75px pd-0 mg-0" style="vertical-align: middle;">상세품목</div>
        <div class="inline-block pd-0 mg-l--5 ta-c">
            <select name="detailItem" id="detailItem" onchange="updateProductOptions()" style="vertical-align: middle;">
                <option value="" selected disabled>상세품목을 선택하세요</option>
            </select>
        </div>
        <hr>
        <br>
        <div class="inline-block w-75px pd-0 mg-0" style="vertical-align: middle;">상품</div>
        <div class="inline-block w-400px pd-0 mg-l--5 ta-c">
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
    </style>
<%@ include file="../common/foot.jspf"%>