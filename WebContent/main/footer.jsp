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
	<link href="${conPath }/css/footer.css" rel="stylesheet">
</head>
<body>
<footer>

  <div id="footer_conts">
    <a href="#">오시는길</a>
    <div class="img1">
       <p><img src="${conPath }/img/footer.PNG" width="300px;" ></p>
     </div>
   <p>오시는길</p>
     <p>제주 제주시 조천읍 비자림로 638 | <b><a href="${conPath }/adminLoginView.do">관리자모드</a></b></p>
  </div>
</footer>
</body>
</html>
  <!-- <p>오시는길</p>
     <p>제주센트럴파크(구. 미니랜드)에서 산굼부리 방향으로 200m 앞에 있습니다. 에코랜드, 사려니숲길, 제주센트럴파크, 교래자연휴양림, 절물자연휴양림, 돌문화공원 근처 5분 거리에 있습니다.﻿
                  주차정보넓은 주차공간</p> -->