<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>
<div class="body">
  <nav class="menu_box_1">
      <ul class="height-100p flex">
        <li>
          <a href="article/item" class="flex flex-ai-c height-100p">품목별 가격정보</a>
          <ul>
            <li><a href="#">곡물가공품
             </a></li>
            <li><a href="#">정육·난류
             </a></li>
            <li><a href="#">수산가공품
             </a></li>
            <li><a href="#">낙농·수산가공품
             </a></li>
            <li><a href="#">조미료·장류·식용유
             </a></li>
            <li><a href="#">채소
             </a></li>
            <li><a href="#">과자·빙과류
             </a></li>
            <li><a href="#">차·음료·주류
             </a></li>
            <li><a href="#">미용품
             </a></li>
            <li><a href="#">세탁·주방·가사용품
             </a></li>
            <li><a href="#">생선류
             </a></li>
            <li><a href="#">기타 가공식품
             </a></li>
            <li><a href="#">곡물
             </a></li>
          </ul>
        </li>
        <li>
          <a href="#" class="flex flex-ai-c height-100p">장바구니 가격비교</a>
          <ul>
          </ul>
        </li>
        <li>
          <a href="#" class="flex flex-ai-c height-100p">생필품 할인 정보</a>
          <ul>
          </ul>
        </li>
      </ul>
      <div class="bg"></div>
    </nav>
</div>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
html {
  font-family: "Roboto", "Noto Sans KR", sans-serif;
}
body,
ul,
li,
h1 {
  margin: 0;
  padding: 0;
  list-style: none;
}

a {
  color: inherit;
  text-decoration: none;
}
.height-100p {
  height: 100%;
}

* > .flex {
  display: flex;
}

* > .flex-ai-c {
  align-items: center;
}

@media (max-width: 1024px) {
  .visible-on-web_size {
    display: none;
  }
}

@media (min-width: 1025px) {
  .visible-on-mobile_size {
    display: none;
  }
}
.body > .menu_box_1 > ul > li > a {
  font-weight: bold;
  color: #1e1e1e;
  font-size: 17px;
  padding: 0 10px;
  position: relative;
}

.body > .menu_box_1 > ul > li > a::after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 3px;
  background-color: transparent;
  transition: background-color 0.3s, width 0.3s;
}

.body > .menu_box_1 > ul > li:hover > a::after {
  width: 100%;
  background-color: black;
}

.body > .menu_box_1 > ul > li {
  position: relative;
}

.body > .menu_box_1 > ul > li > ul {
  position: absolute;
  z-index: 1;
  top: 100%;
  left: 0;
  opacity: 0;
  visibility: hidden;
  padding: 17px 0;
  transition: opacity 0.2s, visibility 0.2s;
}

.body > .menu_box_1 > ul > li:hover > ul {
  opacity: 1;
  visibility: visible;
  transition: opacity 0.5s, visibility 0.5s;
}

.body > .menu_box_1 > ul > li > ul > li > a {
  white-space: nowrap;
  font-size: 17px;
  font-weight: bold;
  color: #666666;
  display: block;
  padding: 10px 0;
}

.body > .menu_box_1 > ul > li > ul > li:hover > a {
  color: #1e1e1e;
}

.body .menu_box_1 > .bg {
  position: absolute;
  top: 100%;
  width: 100%;
  height: 0;
  left: 0;
  background-color: white;
  transition: height 0.1s;
}
.menu_box_1{
 padding-left:38%;
 height:40px;
}
</style>
<%@ include file="../common/foot.jspf"%>