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
	<form action="${conPath }/ReivewModify.do" method="post" enctype="multipart/form-data">
	   <input type="hidden" name="pageNum" value="${param.pageNum }">
	   <input type="hidden" name="mid" value="${reivewModify.mid }">
	   <input type="hidden" name="dbMphoto" value="${reivewModify.mphoto }">
	   <table>
	     <caption>리뷰  수정 ${reivewModify } </caption>
	     
	    <tr>
	    
	     <th>메뉴사진</th>
	       <td><input type="file" name="mphoto">
	       <c:if test="${not empty menuContent.mphoto  }">
         <img src="${conPath }/reivewPhotoUp/${reivewModify.mphoto }"  width="150">    	          
       </c:if>
	        </td>
	     </tr>
	    
	    <tr>
	      <th>제목</th>
	      <td><input type="text" name="mtitle"  required="required" size="30"
	                   value="${reivewModify.mtitle }"></td>
	    </tr>
	    
	      <tr>
	         <th>본문</th>
			 <td><textarea rows="5" cols="32" 
		     name="mcontent">${reivewModify.mcontent }</textarea></td>
		  </tr>
		 
		  <tr>
		     <td colspan="2">
		       <input type="submit" value="수정" class="btn">
		       <input type="reset" value="이전" class="btn" onclick="history.back()">
			 </td>
		  </tr>
	   </table>
	   </form>
	</div>
</body>
</html>