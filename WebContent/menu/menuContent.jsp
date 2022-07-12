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
	<!--  APHOTO , MENUNAME , FOODCONTENT  -->
	<style>
	


	</style>
</head>
<body>
	<div id="content_form">
	   <table>
	     <caption>${menuContent.menuname } 상세보기</caption>
	      <tr>
	    
	     <th>메뉴사진</th>
	       <td>
	       <c:if test="${not empty menuContent.aphoto  }">
	     <img src="${conPath }/MenuUp/${menuContent.aphoto }"  width="500px" >
	          
       </c:if>
	        </td>
	     </tr>
	     <tr>
	       <th>메뉴이름</th>
	         <td>
	         ${menuContent.menuname }
	        </td>
	     </tr>
	     <tr>
	       <th>메뉴설명</th>
	       <td>
	         ${menuContent.foodcontent }
	       </td>
	     </tr>
	  
	  <tr>
	    <td colspan="2">
	     <c:if test="${not empty admin}">
                <button onclick="location='${conPath }/MenuModifyView.do?foodid=${menuContent.foodid }&pageNum=${param.pageNum }'">수정</button>
                <button onclick="location='${conPath }/MenuDelete.do?foodid=${menuContent.foodid }&pageNum=${param.pageNum }'">삭제</button>
         </c:if>
               <button onclick="location='${conPath }/MenuallView.do?foodid=${menuContent.foodid }&pageNum=${param.pageNum }'">뒤로가기</button>
	    </td>
	    </tr>
	   </table>
	</div>
</body>
</html>