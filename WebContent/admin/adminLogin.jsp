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
<c:if test="${not empty ajoinResult }">
	<script>
		alert('${ajoinResult }');
	</script>
	</c:if>
	
<c:if test="${not empty ajoinError }">
	<script>
		alert('${ajoinError }');
		history.back();
	</script>
	</c:if>
<div id ="content_form">
<form action="${conPath }/adminLogin.do" method="post">
   <table>
    <tr>
      <th>ID</th> <!-- 회원가입후 mId 넘겨주기 -->
         <td><input type="text" name="aId" value="${aId }" required="required"></td><!-- mid가 없으면 그냥 빈스트링 -->
   </tr>
    <tr>
      <th>PW</th>
         <td><input type="password" name="aPw" required="required"></td>
    </tr>
    <tr>
    <td colspan="2">
      <input type="submit" value="로그인" class="btn">
      <input type="button" value="관리자등록" class="btn" onclick="location='${conPath }/adminjoinView.do'">
     </td>
    </tr>
   </table>
 </form>
 </div>	
</body>
</html>