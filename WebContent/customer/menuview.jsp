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
</head>
<body>
<div id="content_form">
	<table>
		<caption>메뉴보기</caption>
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
	<tr>
			<c:forEach var="dto" items="${mAllView  }">
				<td>
					<img src="${conPath }/MenuUp/${dto.aphoto }"  width="150"><br>
					 ${dto.menuname }<br>
					(${dto.menuprice })
				</td>
			</c:forEach>
		</tr>
	</table>
	</div>	
</body>
</html>