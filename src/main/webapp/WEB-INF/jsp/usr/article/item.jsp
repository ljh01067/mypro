<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ITEM"></c:set>
<%@ include file="../common/head.jspf"%>
<div class="block w-500px pd-0 mg-0 bg-gold">
<div class="inline-block w-100px bg-red pd-0 mg-0">업소</div>
<div class="inline-block w-400px bg-blue pd-0 mg-l--5 ta-c">
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
    <style>
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
    .w-100px{
    width:100px;
    }
    .w-400px{
    width:400px;
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
    text-aline:center;
    }
    </style>
<%@ include file="../common/foot.jspf"%>