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
<link href="${conPath }/css/join.css" rel="stylesheet">
<style>
td {
 font-size: 2em;
}
</style>
</head>
<body>
	<form action="${conPath }/withdrawal.do" method="post">
		<table>
			<caption>회원 탈퇴</caption>
			<tr>
				<td>${customer.cName }님</td>
			</tr>
			<tr>
				<td>아이디 : ${customer.cId }</td>
			</tr>
			
				<caption>탈퇴는 슬퍼요 ㅠㅠ 그래도 진행 하시 겠습니까?</caption>
			</table>
			<div class="create">
				<input class="but3" type="submit" value="넵!탈퇴할거에요">
				<input class="but4" type="button" value="이전" onclick="history.go(-1)" >
			</div>
		
	</form>
</body>
</html>