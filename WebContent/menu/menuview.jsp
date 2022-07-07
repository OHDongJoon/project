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
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gugi&display=swap" rel="stylesheet">
<style>


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
	$('tr').click( function() {
		var foodid = Number($(this).children().eq(0).text());// 0 번째 td안의 있는 text;
		if (!isNaN(foodid)) {
			alert(foodid);
		location.href = '${conPath }/MenuContent.do?foodid='+ foodid+ '&pageNum=${pageNum}';
		}
});
});
</script>
</head>
<body>
	

	<c:if test="${not empty menuInsert }">
		<script>
			alert('&{menuInsert } 메뉴등록 성공');
		</script>
	</c:if>
	
	<c:if test="${not empty menuUpdate }">
		<script>
			alert('&{menuUpdate } 메뉴 수정 성공');
		</script>
	</c:if>
	
	<c:if test="${not empty menuDeleteResult }">
		<script>
			alert('&{menuDeleteResult }');
		</script>
	</c:if>
	
	
	<c:if test="${not empty reivew }">
		<script>
			alert('&{reivew }');
		</script>
	</c:if>
	
	<%--   <h1 class="title1">교래향 식당</h1>
  <h2 class="title2">  <br>제주의 맛을 느껴보세요 !</h2>
  <c:forEach var="dto" items="${mAllView  }">
  <div class="food">
    <img src="${conPath }/MenuUp/${dto.aphoto }"width="500px" height="300px">
    <div class="info">
 
    
       <h3>${dto.foodid }</h3>
      <h3>${dto.menuname }</h3>
      <h3>(${dto.menuprice })</h3>
      <p>평점</p>
   
     
    </div>
  </div>
  </c:forEach> --%>
 
	<div id="content_form">
		<table>
		  
			<tr>
				<th>메뉴번호</th>
				<th>메뉴사진</th>
				<th>메뉴이름</th>
				<th>메뉴가격</th>
				<th>메뉴평점</th>
			</tr>

			<c:forEach var="dto" items="${mAllView  }">
				<tr>
                    
					<td>${dto.foodid } </td>
					<td><img src="${conPath }/MenuUp/${dto.aphoto }" width="150"></td>
					<td>${dto.menuname }<br></td>
					<td>(${dto.menuprice })</td>					
					<td>  <!--  avg  double 형 반환   -->
						 <c:if test="${dto.avg == -1 }">
							등록된 평점이 없습니다
						 </c:if>
						 <c:if test="${dto.avg >= 1 and dto.avg < 2 }">
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 </c:if>
						 <c:if test="${dto.avg >= 2 and dto.avg < 3 }">
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 </c:if>
						  <c:if test="${dto.avg >= 3 and dto.avg < 4 }">
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 </c:if>
						  <c:if test="${dto.avg >= 4 and dto.avg < 5 }">
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 </c:if>
						  <c:if test="${dto.avg == 5 }">
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	<img  src="${conPath }/img/star.png" width=15px;>
						 	
						 </c:if>
					</td>
<!-- 				   		<td> -->
<%-- 					<c:if test=${(dto.avg >= 1) and (dto.avg < 2) }>   --%>
<%-- 						<img  src="${conPath }/img/star.png" width=15px;> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${(dto.avg >=2) and (dto.avg < 3) }"> --%>
<%-- 						<img  src="${conPath }/img/star.png" width=15px;> --%>
<%-- 						<img  src="${conPath }/img/star.png" width=15px;> --%>
<%-- 					</c:if> --%>
<!-- 						</td> -->
				</tr> 
				
			</c:forEach>
		</table>
	</div> 
</body>
</html>	
				