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
<!-- Favicons
    ================================================== -->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gugi&display=swap" rel="stylesheet">


<link href="${conPath }/css/main.css" rel="stylesheet">
<style>
	
</style>
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
			alert(' ${loginErrorMsg}');
			history.back();
		</script>
	</c:if>

	<c:if test="${not empty modifyResult }">
		<script>
			alert(' ${modifyResult}');
		</script>
	</c:if>

	<c:if test="${not empty withdrawalResult }">
		<script>
			alert(' ${withdrawalResult }');
		</script>
	</c:if>

	<c:if test="${not empty menuInsertResult }">
		<script>
			alert(' ${menuInsertResult }');
		</script>
	</c:if>


	<jsp:include page="../main/header.jsp" />
	<div id="main">
  <div class="intro">
    <div class="overlay">
      <div class="container">
        <div class="row">
          <div class="intro-text">
            <h1>교래향</h1>
            <p>Reservations: (887) 654-3210</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Features Section -->
<div id="features" class="text-center">
  <div class="container">
     
    <div class="section-title">
      <h1 class="go1">menu</h1> 
    </div>
   
    <div class="row">
     <div id="all">
      <div class="col-xs-12 col-sm-4">
          <div class="features-item">
              
              <img src="${conPath }/img/DSC_9924.JPG" class="img-responsive" alt="">
              <h3>갈치조림_4인</h3>
              <p>갈치조림(대) + 보말미역국 + 솥밥 </p>
          </div>
      </div> <!--  1번  -->
      <div class="col-xs-12 col-sm-4">
          <div class="features-item">
             
              <img src="${conPath }/img/DSC_8407.JPG" class="img-responsive" alt="">
              <h3>갈치구이_4인</h3>
              <p>갈치구이(대) + 성게미역국 + 솥밥</p>
          </div>
      </div>  <!--  2번 -->
      <div class="col-xs-12 col-sm-4">
          <div class="features-item">
              <img src="${conPath }/img/do.JPG" class="img-responsive" alt="">
              <h3>두루치기</h3>
              <p>두루치기 + 보말 미역국</p>
          </div>
      </div>  <!--  3본 -->
      <div class="features-item2">
              <img src="${conPath }/img/DSC_8390.JPG" class="img-responsive" alt="">
             <h3>갈치구이_2인</h3>
              <p>갈치조림(중) + 보말 미역국 + 솥밥</p>
          </div>
       <!--  1번  -->
      <div class="col-xs-12 col-sm-4">
          <div class="features-item2">	
              <img src="${conPath }/img/DSC_9954.JPG" class="img-responsive" alt="">
              <h3>성게미역국</h3>
              <p>성게미역국 + 솥밥추가 1000원 </p>
          </div>
      </div>  <!--  2번 -->
      <div class="col-xs-12 col-sm-4">
          <div class="features-item2">
              <img src="${conPath }/img/bob.JPG" class="img-responsive" alt="">
              <h3>솥밥</h3>
              <p>따끈따끈한 솥밥</p>
          </div>
      </div>  <!--  3본 -->
      </div>
      </div>
    </div>
  </div>
<jsp:include page="../main/footer.jsp" />
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