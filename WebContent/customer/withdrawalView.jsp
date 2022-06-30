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
</head>
<body>
<form action="${conPath }/withdrawal.do" method="post" >
	<table>
	<tr><td>${customer.cName } 님</td></tr>
	<tr><td> 아이디 : ${customer.cId } </td></tr>
	 <tr><td> 탈퇴를 진행 하시겠습니까? </td></tr>
	 <tr>
	 <td colspan="2"> 
	 <input type="submit" value="탈퇴하기">
	 <input type="button" value="이전" onclick="history.go(-1)" class="btn">
	 </td>
	 </table>
	</form>
</body>
</html>