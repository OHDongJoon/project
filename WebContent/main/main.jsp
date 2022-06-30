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
<link href="${conPath }/css/main.css" rel="stylesheet"> 
</head>
<body>
  <c:if test="${not empty adminLoginResult }">
		<script>
		alert('${adminLoginResult }');
		</script>
	</c:if>
	<c:if test="${not empty awithdrawalResult }">
	   <script>
	    alert('${awithdrawalResult }');
	   </script>
	</c:if>
	
	 <c:if test="${not empty adminloginErrorMsg }">
		<script>
		alert('${adminloginErrorMsg }');
		history.back();
		</script>
	</c:if>
	<c:if test="${not empty loginErrorMsg }">
	<script>
		alert(' ${loginErrorMsg}' );
		history.back();
	</script>
	</c:if>
	
	<c:if test="${not empty modifyResult }">
	<script>
		alert(' ${modifyResult}' );
		
	</script>
	</c:if>
	
	<c:if test="${not empty withdrawalResult }">
	<script>
		alert(' ${withdrawalResult }' );
	</script>
	</c:if>
	
	<c:if test="${not empty menuInsertResult }">
	<script>
		alert(' ${menuInsertResult }' );
	</script>
	</c:if>
<jsp:include page="../main/header.jsp"/>
<header>
	<div id ="content">
		 <h4>교래향은'제라진 안심식당'으로 지정된 업체입니다. </h4>
		 <p>저희는 음식 덜어먹기용 개인용 접시, 집게 등 제공 위생적인 수저관리,<br>
		       종사자 마스크착용 , 손 소독용 용품 또는 장치 비치 , 하루 2회 이상 소독 및 환기를  합니다.<br>
		     교래향은 제주도통갈치구이, 갈치조림 전문점으로 모든 수산물과 식재료를 제주산, <br> 
		       국내산으로 사용합니다. 모든 고객분들께 정성을 다해 대접하겠습니다.</p>
	</div>
	<div id ="main">
		     <p><a href="#">메뉴더보기 ▶</a></p>
	  <div class="manu1">
		  <img src="${conPath }/img/DSC_9924.JPG" width=250px;>
		   <img src="${conPath }/img/logo2.JPG" width=250px;>
		   <img src="${conPath }/img/sung.JPG" width=250px;>
	 </div>
	</div>
	<div id="main2">
	  <div class="manu2">
		   <img src="${conPath }/img/DSC_8390.JPG" width=250px;>
		   <img src="${conPath }/img/do.JPG" width=250px;>
		   <img src="${conPath }/img/galjo.JPG" width=250px;>
	  </div>
	</div>
</header>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>