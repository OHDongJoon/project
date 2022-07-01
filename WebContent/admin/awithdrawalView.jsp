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
	<link href="${conPath }/css/join.css" rel="stylesheet">
<style>
td {
 font-size: 2em;
}
</style>
</head>
<body>
<form action="${conPath }/awithdrawal.do" method="post">
		<table>
			<caption>관리자 탈퇴</caption>
			<tr>
				<td>${admin.aName }님</td>
			</tr>
			<tr>
				<td>아이디 : ${admin.aId }</td>
			</tr>
			
				<caption>탈퇴를 진행 하시겠습니까?</caption>
			</table>
			<div class="create">
				<input class="but3" type="submit" value="탈퇴하기">
				<input class="but4" type="button" value="이전" onclick="history.go(-1)" >
			</div>
		
	</form>
</body>
</html>