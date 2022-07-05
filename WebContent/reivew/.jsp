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
<div id="content_form">
		<form action="${conPath }/boardReply.do" method="post" enctype="multipart/form-data">
			<!-- reply.do시 필요한 원글 정보 : bGroup, bStep, bIndent
			                              지금 입력할 답변글 : bName, bTitle, bContent
			                       pageNum -->
			<input type="hidden" name="mgroup" value="${originBoard.fGroup }">
			<input type="hidden" name="mstep" value="${originBoard.fStep }">
			<input type="hidden" name="mindent" value="${originBoard.fIndent }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<caption>${originReivew.mid }번글의 답변쓰기 폼</caption>
				<tr><td>작성자</td><td>${customer.cName }(${customer.cid })</td></tr>
				<tr><td>제목</td><td><input type="text" name="mtitle"
								required="required" size="30"
								value="[답]${originReivew.mtitle }"></td></tr>
				<tr><td>본문</td><td><textarea name="fcontent" rows="3" cols="3"></textarea></td></tr>
				<tr><td>사진</td><td><input type="file" name="mphoto"></td></tr>
				<tr><td colspan="2">
							<input type="submit" value="답변쓰기" class="btn">
							<input type="reset" value="취소" class="btn">
							<input type="button" value="목록" class="btn"
								onclick="location.href='${conPath}/reivewList.do'">
			</table>
		</form>
	</div>	
</body>
</html>