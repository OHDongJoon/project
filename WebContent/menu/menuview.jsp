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
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
#content_form {
	width: 1200px;
	height: 470px;
	margin: 300px auto 0px;
}

#content_form table tr {
	height: 10px;
}

#content_form table {
	border: 2px solid pink;
	width: 90%;
	margin: 0px auto;
}

#content_form table tr {
	background-color: #FFE271;
	height: 40px;
}

#content_form table tr:hover {
	background-color: orange;
	cursor: pointer;
}

#content_form td, #content_form th {
	text-align: center;
	padding: 5px;
}

#content_form caption {
	font-size: 18px;
	padding: 10px;
}

#content_form h2, #content_form b {
	text-align: center;
	color: red;
}

#content_form a {
	text-decoration: none;
	color: black
}

#content_form .left {
	text-align: left;
}

#content_form .paging {
	text-align: center;
}

#content_form input:not(.btn), #content_form textarea {
	width: 90%;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('tr')
								.click(
										function() {
											var foodid = Number($(this)
													.children().eq(0).text());// 0 번째 td안의 있는 text;
											if (!isNaN(foodid)) {
												alert(foodid);
												location.href = '${conPath }/MenuContent.do?foodid='
														+ foodid
														+ '&pageNum=${pageNum}';
											}
										});
					});
</script>
</head>
<body>
	<c:if test="${not empty mAllView }">
		<script>
			alert('&{mAllView } 메뉴는 왔어');
		</script>
	</c:if>
	<c:if test="${ empty mAllView }">
		<script>
			alert('${mAllView } 메뉴 안왔어 임마');
		</script>
	</c:if>
	<div id="content_form">
		<table>
			<tr>
				<th>메뉴번호</th>
				<th>메뉴사진</th>
				<th>메뉴이름</th>
				<th>메뉴가격</th>
				<th>평점</th>
			</tr>
			<c:forEach var="dto" items="${mAllView  }">
				<tr>

					<td>${dto.foodid }</td>
					<td><img src="${conPath }/MenuUp/${dto.aphoto }" width="150"></td>
					<td>${dto.menuname }<br></td>
					<td>(${dto.menuprice })</td>
					<td>${dto.star }</td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>