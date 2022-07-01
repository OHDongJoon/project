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
	<link href="${conPath }/css/adminjoin.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<style>
	
	</style>
</head>
<body>
	<form action="${conPath }/adminjoin.do" method="post" >
		<div class="container">
	   <div class="insert">	
		<table>
			<caption>관리자등록</caption>
			<tr>
				 <td class="col1">이름</td>
				 <td class="col2">
				 <input type="text" name="cName" required="required">
				 </td>
			</tr>
			<tr>
			 <td class="col1">아이디</td>
			  <td class="col2">
			  <input type="text" name="cId" required="required">
			  <div id="idConfirmResult"> &nbsp; </div>
			 </td>
			</tr>
			<tr>
			  <td class="col1">비밀번호</td>
			  <td class="col2">
			  <input type="password" name="cPw" required="required">
			  </td>
			</tr>
				</table>
				</div>
			<div class="create">
			<input type="submit" value="등록하기" class="but3">
			<input type="button" value="이전" onclick="history.go(-1)" class="but4">
		   </div>
		 </div>
			</form>
			
		
</body>
</html>