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
	<form action="${conPath }/noticeModify.do" method="post">
	   <input type="hidden" name="pageNum" value="${param.pageNum }">
	   <input type="hidden" name="foodid" value="${nContent.foodid }">
	   <input type="hidden" name="dbaphoto" value="${menuContent.aphoto }">
	   <table>
	     <caption>${menuContent.menuname }메뉴  수정</caption>
	    <tr>
	    
	     <th>메뉴사진</th>
	       <td>
	       <c:if test="${not empty menuContent.aphoto  }">
	     <img src="${conPath }/MenuUp/${menuContent.aphoto }"  width="150">
	          
       </c:if>
	        </td>
	     </tr>
	    
	    <tr>
	      <th>메뉴이름</th>
	      <td><input type="text" name="atitle"  required="required" size="30"
	                   value="${menuContentt.menuname }"></td>
	    </tr>
	    
	      <tr>
	         <th>메뉴설명</th>
			 <td><textarea rows="5" cols="32" 
		     name="acontent">${menuContent.foodcontent }</textarea></td>
		  </tr>
		  <tr>
	      <th>메뉴가격</th>
	      <td><input type="text" name="atitle"  required="required" size="30"
	                   value="${menuContentt.menuprice }"></td>
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