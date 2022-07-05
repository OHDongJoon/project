<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/.css" rel="stylesheet">
	<style>
	
	/* footer {
	  font-family: 'Gugi', cursive;
    border-top: solid 2px black;
    background: var(--color-beige);
    top:0;
    width: 1200px;
    height : 300px;
    display: flex;
    flex-direction: column;
    align-items: center;
	   
	  }
	  #footer_box{
	   width : 1000px;
	   height: 100px;
	   margin : 0 auto;
	   border:var( --temp-border);
	  }
	  #footer_logo {
	  float : left;
	  margin : 20px 0 50 20px;
	  }
	  #footer_box #address {
	   
	   margin : 45px 0 0 30px;
	  }
	  li {
	    list-style-type: none; 
	 
	  }
	  * {
    margin: 0;
  
    padding: 0;
    color:var(--color-font-black);
   
} */
	</style>
</head>
<body>

 <footer id ="footer">
  <div class="auto">
       <span class="footerlogo">
       <img class="head-logo" src="${conPath }/img/logo.png">
     </span>
       <div class="addrWrap">
         <a href="${conPath }/adminLoginView.do">관리자모드</a>
          <address>
            <p> 제주시 조천읍 비자림로 638   |대표 : 오동준    TEL : 010-2222-2222</p>
            <p class="copyright">COPYRIGHT (C) 교래향 ALL RIGHTS RESERVED</p>
          </address>
       </div>
  </div>
</footer>

</body>
</html>
  <!-- <p>오시는길</p>
     <p>제주센트럴파크(구. 미니랜드)에서 산굼부리 방향으로 200m 앞에 있습니다. 에코랜드, 사려니숲길, 제주센트럴파크, 교래자연휴양림, 절물자연휴양림, 돌문화공원 근처 5분 거리에 있습니다.﻿
                  주차정보넓은 주차공간</p> -->