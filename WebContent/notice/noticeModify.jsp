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
<body><!-- Nmodify 작성자 id  작성자  제목  본문 -->
	 <div id="content_form">
	<form action="${conPath }/noticeModify.do" method="post">
	   <input type="hidden" name="pageNum" value="${param.pageNum }">
	   <input type="hidden" name="nid" value="${nContent.nid }">
	   <table>
	     <caption>${nContent.nid }번 공지글 수정</caption>
	    <tr>
	       <th>작성자</th>
	         <td><input type="text" required="required" size="30"
	             value="${nContent.aname } (${nContent.aid })" readonly="readonly">
	          </td>
	    </tr>
	    
	    <tr>
	      <th>제목</th>
	      <td><input type="text" name="atitle"  required="required" size="30"
	                   value="${nContent.atitle }"></td>
	    </tr>
	    
	      <tr>
	         <th>본문</th>
			 <td><textarea rows="5" cols="32" 
		     name="acontent">${nContent.acontent }</textarea></td>
		  </tr>
		  
		  <tr>
		     <td colspan="3">
		       <input type="submit" value="수정" class="btn">
			   <input type="button" value="목록"  class="btn"onclick="location='${conPath}/NoticeList.do?pageNum=${param.pageNum }'">
		       <input type="reset" value="이전" class="btn" onclick="history.back()">
			 </td>
		  </tr>
	   </table>
	   </form>
	</div>
</body>
</html>