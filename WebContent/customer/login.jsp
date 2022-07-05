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
	<link href="${conPath }/css/login.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty errorMsg}">
		<script>
			alert('${loginErrorMsg}');
		</script>
	</c:if>
	<c:if test="${not empty joinResult }">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>	

 <form action="${conPath }/login.do" method="post" id ="login-form">
 <header>
   <p>로그인</p>
</header>
     <div class="input-box">
        <input id="username" type="text" name="cId" value="${cId }" placeholder="아이디" required="required"><!-- mid가 없으면 그냥 빈스트링 -->
        <label for="username">아이디</label>
     </div>
     <div class="input-box">
      <input id="password" type="password" name="cPw" placeholder="비밀번호" required="required">
       <label for="password">비밀번호</label>
     </div>
      <input type="submit" value="로그인"  >
      <input class="but4" type="button" value="뒤로가기" onclick="history.go(-1)">
  
 </form>
</body>
</html>