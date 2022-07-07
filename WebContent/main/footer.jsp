<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/footer.css" rel="stylesheet">
<style>

/*  footer {
	
   
    background:;
    border : 1px solid black;
    top:0;
    width: 1200px;
     line-height : 40px;
    margin:0 auto;
    height : 300px;
    overflow:hidden;
	   
	  }
	 
	  .footerlogo {
	 	 float : left;
	 	 margin-left:50px;
	  }
	  footer .addrWrap {
	  	float:left;
	  	text-align: center;
	  	width: 500px;
	  	margin: 50px 50px;
	  }
	 
	  * {
    margin: 0;
  	list-style:none;
    padding: 0;
    color:var(--color-font-black);
   
}  */
</style>
</head>
<body>

	<footer>
		<%-- <div class="footerlogo">
       <img class="head-logo" src="${conPath }/img/logo.png" width="100">
     </div>
       <div class="addrWrap">
         <a href="${conPath }/adminLoginView.do">관리자모드</a>
          <address>
            <p> 제주시 조천읍 비자림로 638   |대표 : 오동준    TEL : 010-2222-2222</p>
            <p class="copyright">COPYRIGHT (C) 교래향 ALL RIGHTS RESERVED</p>
          </address>
       </div> --%>


		<div id="footer1">
			<a href="${conPath }/main.do"><img src="${conPath }/img/logo.png" class="logo" alt="logo" /></a>
		</div>
		<div id="footer2">
			<div id="address">
				제주시 조천읍 비자림로 638 | 대표 : 오 동준 <br>
				TEL 010-2222-2222 | FAX 02-318-4439 <br>
				COPYRIGHT (C) 교래향 ALL RIGHTS RESERVED
			</div>
		</div>
		<div id="footer3">
		<a class="admin" href="${conPath }/adminLoginView.do">관리자모드</a>
		</div>




	</footer>

</body>
</html>
<!-- <p>오시는길</p>
     <p>제주센트럴파크(구. 미니랜드)에서 산굼부리 방향으로 200m 앞에 있습니다. 에코랜드, 사려니숲길, 제주센트럴파크, 교래자연휴양림, 절물자연휴양림, 돌문화공원 근처 5분 거리에 있습니다.﻿
                  주차정보넓은 주차공간</p> -->