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
	<form action="${conPath }/Menuinsert.do" method="post" enctype="multipart/form-data">
	<table>
	  <caption>메뉴등록</caption>
	  <tr>
	    <th>메뉴이름</th>
	    <td><input type="text" name="menuname" required="required"></td>
	  </tr>
	 <tr>
	    <th>메뉴가격</th>
	    <td><input type="text" name="menuprice" required="required"></td>
	  </tr>
	  <tr>
	    <th>메뉴사진</th>
	    <td><input type="file" name="aphoto" required="required"></td>
	  </tr>
	  <tr>
	     <th>메뉴설명</th>
	     <td>
	     	<textarea rows="5" cols="10"name="foodcontent"></textarea>
	     </td>
	  </tr>
	 
	  <tr>
	     <td colspan="3">
	       <input type="submit" value="메뉴등록">
	       <input type="reset" value="취소" >
	      <input type="button" value="이전" onclick="history.go(-1)" class="btn">

	      </td>
	</table>
	</form>
</body>
</html>