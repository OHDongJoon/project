<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<!-- 프로젝트용 -->
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/header.css" rel="stylesheet">
<style>
	
</style>
</head>
<body>
<header>
	  <c:if test="${empty customer and empty admin}"> <%-- 로그인 전 화면 --%>
   <div class="gnb">
        <ul class="left">
         <li><a href="#">오시는길</a>
         <li><a href="#">메뉴보기</a>
          <li><a href="#">후기</a></li>
       </ul>
        <ul class="center">
         <li><a href="${conPath }/main.do" class="logo1">교래향</a></li>
         <!-- <img src="https://cdn.pixabay.com/photo/2014/04/02/16/22/chef-307076__340.png" width=40px height=50px;> --></li>
        </ul>
        <ul class="right">
         
          <li><a href="${conPath }/boardList.do">공지사항</a></li>
          <li><a href="${conPath }/joinView.do">회원가입</a></li>
          <li><a href="${conPath }/loginView.do">로그인</a></li>
       </ul>
   </div>
	</c:if>
	 <c:if test="${not empty customer and empty admin}"> 사용자 모드 로그인 화면
		 <div class="gnb">
        <ul class="left">
         <li><a href="#">오시는길</a>
         <li><a href="#">메뉴보기</a>
          <li><a href="#">후기</a></li>
       </ul>
        <ul class="center">
         <li><a href="${conPath }/main.do" class="logo1">교래향 </a></li>
         <li><p>${customer.cName }님 &nbsp;▶</p></li>	
         <!-- <img src="https://cdn.pixabay.com/photo/2014/04/02/16/22/chef-307076__340.png" width=40px height=50px;> --></li>
        </ul>
        <ul class="right">
         
          <li><a href="${conPath }/boardList.do">공지사항</a></li>
          <li><a href="${conPath }/modifyView.do">정보수정</a></li>
          <li><a href="${conPath }/logout.do">로그아웃</a></li>
         <%--  <li><a>${customer.cName }님  ♡</a></li> --%>
       </ul>
   </div>
	</c:if>
	
	<c:if test="${empty member and not empty admin}"> 관리자 모드 로그인 화면
		<div class="gnb">
        <ul class="left">
         <li><a href="#">메뉴보기</a>
         <li><a href="${conPatn }/adminMenuView.do">>메뉴등록</a></li>
          <li><a href="#">후기</a></li>
       </ul>
        <ul class="center">
         <li><a href="${conPath }/main.do" class="logo1">교래향 </a>
         <li><p>관리자${admin.aName }님</p></li>
         <!-- <img src="https://cdn.pixabay.com/photo/2014/04/02/16/22/chef-307076__340.png" width=40px height=50px;> --></li>
        </ul>
        <ul class="right">
          <li><a href="${conPath }/boardList.do">공지사항</a></li>
          <li><a href="${conPath }/logout.do">관리자모드 나가기</a></li>
          <li><a href="${conPath }/awithdrawalView.do">탈퇴하기</a></li>
          
          
       </ul>
   </div>
	</c:if> 
</header>
</body>
</html>