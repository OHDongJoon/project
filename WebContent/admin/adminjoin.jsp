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
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	
</head>
<body>
<div id="content_form">
	<form action="${conPath }/adminjoin.do" method="post" >
		<table>
			<caption>회원가입</caption>
			<tr><th>아이디</th>
					<td>
						<input type="text" name="aId" required="required">
					</td>
			</tr>
			<tr><th>비밀번호</th>
					<td><input type="password" name="aPw" required="required"></td>
			</tr>
			<tr><th>이름</th>
					<td><input type="text" name="aName" required="required"></td>
			</tr>
			<tr><td colspan="3">
						<input type="submit" value="등록하기" class="btn">
						<input type="reset" value="초기화" class="btn">
						<input type="button" value="이전" onclick="history.go(-1)" class="btn">
		    </td>
		    </tr>
			</table>
			</form>
			</div>	
</body>
</html>