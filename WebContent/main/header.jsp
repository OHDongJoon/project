<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>

<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gugi&display=swap" rel="stylesheet">
<!-- 프로젝트용 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/header.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	 <header>
		<c:if test="${empty customer and empty admin}">
			<%-- 로그인 전 화면 --%>
			 <div class="head-wrap">
            <div class="head-wrap-inner">
                <img class="head-logo" src="${conPath }/img/logo.png">
                <nav class="head-menu-top-nav">
                    <ul>     
                            <li class="top-nav01"><a href="#">오시는길</a></li>
							<li class="top-nav02"><a href="${conPath }/MenuallView.do">메뉴보기</a></li>
							<li class="top-nav03"><a href="#">후기</a></li>
							 <li class="top-nav04"><a href="${conPath }/main.do">홈</a></li>
                    </ul>
                 </nav>
            </div>
            <div class="head-wrap-sub">
                <nav class="head-menu-main-nav">
                    <ul>
                     <li class="main-nav01"><a href="${conPath }/NoticeList.do">공지사항</a></li>
					<li class="main-nav02"><a href="${conPath }/joinView.do">회원가입</a></li>
					<li class="main-nav03"><a href="${conPath }/loginView.do">로그인</a></li>
                    </ul>
            </nav>
            </div>
        </div>
		</c:if>
        
		
		<c:if test="${not empty customer and empty admin}"> 
		
		<div class="head-wrap">
            <div class="head-wrap-inner">
                <img class="head-logo" src="${conPath }/img/logo.png">
                <nav class="head-menu-top-nav">
                    <ul>     
                            <li class="top-nav01"><a href="#">오시는길</a></li>
							<li class="top-nav02"><a href="${conPath }/MenuallView.do">메뉴보기</a></li>
							<li class="top-nav03"><a href="#">후기</a></li>
							 <li class="top-nav04"><a href="${conPath }/main.do">홈</a></li>
                    </ul>
                 </nav>
            </div>
            <div class="head-wrap-sub">
                <nav class="head-menu-main-nav">
                    <ul>
                     <li class="main-nav01"><a href="${conPath }/NoticeList.do">공지사항</a></li>
					<li class="main-nav02"><a href="${conPath }/modifyView.do">정보수정</a></li>
					<li class="main-nav03"><a href="${conPath }/logout.do">로그아웃</a></li>
                    </ul>
            </nav>
            </div>
        </div>
		</c:if>
		
		<c:if test="${empty member and not empty admin}"> 관리자 모드 로그인 화면
		
			<div class="head-wrap">
            <div class="head-wrap-inner">
                <img class="head-logo" src="${conPath }/img/logo.png">
                <nav class="head-menu-top-nav">
                    <ul>     
                            <li class="top-nav01"><a href="${conPath }/MenuallView.do">메뉴보기</a></li>
							<li class="top-nav02"><a href="${conPath }/MenuinsertView.do">메뉴등록</a></li>
							<li class="top-nav03"><a href="#">후기</a></li>
							 <li class="top-nav04"><a href="${conPath }/main.do">">홈</a></li>
                    </ul>
                 </nav>
            </div>
            
            <div class="head-wrap-sub">
                <nav class="head-menu-main-nav">
                    <ul>
                     <li class="main-nav01"><a href="${conPath }/NoticeList.do">공지사항</a></li>
					<li class="main-nav02"><a href="${conPath }/logout.do">관리자모드 나가기</a></li>
					<li class="main-nav03"><a href="${conPath }/awithdrawalView.do">탈퇴하기</a></li>
                    </ul>
            </nav>
            </div>
        </div>
		</c:if>
	</header>
</body>
</html>