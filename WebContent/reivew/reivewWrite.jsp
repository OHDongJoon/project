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
	<%-- <link href="${conPath }/css/style.css" rel="stylesheet"> --%>
</head>
<!-- foodid(메뉴) , mtitle(제목) mcontent(본문) , 평점 star  -->
<body>
<div id="content_form">
		<form action="${conPath }/reivewWrite.do" method="post" enctype="multipart/form-data">
			<table>
				<caption>후기쓰기</caption>
			  <tr>
				<td> 후기 음식 </td>
				<td>
					<input type="checkbox" name="foodid" value="1" id="1"><label for="readind">갈치조림</label>
					<input type="checkbox" name="foodid" value="2" id="2"><label for="cooking">두루치기</label>
					<input type="checkbox" name="foodid" value="3" id="3"><label for="exercise">갈치구이</label>
				</td>
			</tr>
				<tr><td>제목</td><td><input type="text" name="mtitle"
								required="required" size="30"></td></tr>
				<tr><td>본문</td><td><textarea name="mcontnet" rows="3" 
								cols="32"></textarea></td></tr>
				<tr><td>첨부파일</td><td><input type="file" name="mphoto"></td></tr>
				
				<tr><td colspan="2">
							<input type="submit" value="글쓰기" class="btn">
							<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/reivewList.do'">
			</table>
		</form>
	</div>
</body>
</html>