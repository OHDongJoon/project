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
 <div id="main">
   <div class = "intro">
     <div class = "overlay">
       <div class="container">
         <div class="row">
         <div class="intro-text">
           <h1>교래향</h1>
           <p>Reservations :(887) 654-3210</p>
         </div>
         </div>
       </div>
     </div>
   </div>
 </div>

</body>
</html>
 
     <%-- <p><a href="#">메뉴더보기 ▶</a></p>
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
	</div> --%>