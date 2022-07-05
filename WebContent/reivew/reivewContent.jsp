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
	<style>
		#content_form {
			width: 800px; height:470px;
			margin: 30px auto 0px;
		}
		#content_form table tr { height: 10px;}
	</style>
</head>
<body>
<%-- <jsp:include page="../main/header.jsp"/> --%>
  <div id="content_form">
  	
    <table>
	    <caption>${reivew.mid }글 상세보기</caption>
	    <tr>
	      <th>작성자</th>
	        <td>${customer.cId } ${reivew.cid } ${reivew.cname } (${reivew.cid }님) </td>
	    </tr>
	    <tr>
	      <th>제목</th>
	        <td>${reivew.mtitle } </td>
	    </tr>
	    <tr>
	      <th>본문</th>
	        <td><pre>${reivew.mcontent }</pre></td> 
	    </tr>
	    <tr>
	      <th>첨부파일</th>
	        <td>
	          <c:if test="${not empty reivew.mphoto  }">
	          <img src="${conPath }/reivewPhotoUp/${reivew.mphoto}" width="150">                    
	          </c:if>
	          <c:if test="${empty reivew.mphoto }">
	            		첨부파일없음
	          </c:if> 
	        </td>
	    </tr>
	    <tr>
	      <th>평점</th>
	      <td>
	         <c:forEach var="i" begin="1" end="${reivew.star }">
	          <c:if test="${i !=reivew.star }"><img src="${conPath }/img/star.png" width=15px;></c:if>
	           <c:if test="${i ==reivew.star }"><img src="${conPath }/img/star.png" width=15px;></c:if>
	           
	         </c:forEach>
	     
	      </td>
	      </tr>
	    <tr><td colspan="3">
				 			<c:if test="${customer.cId eq reivew.cid }"> 
				 				<button onclick="location='${conPath}/reivewModifyView.do?mid=${reivew.mid }&pageNum=${param.pageNum }'">수정</button>
				 			</c:if>
				 			
				 			<c:if test="${customer.cId eq reivew.cid or not empty admin}">
				 				<button onclick="location='${conPath}/reivewDelete.do?mid=${reivew.mid }&pageNum=${param.pageNum }&mgroup=${reivew.mgroup }&mstep=${reivew.mstep }&mindent=${reivew.mindent }'">삭제</button>
				 			</c:if>
				 			
				 			<c:if test="${not empty customer }">
				 				<button onclick="location='${conPath}/reivewReplyView.do?mid=${reivew.mid }&pageNum=${param.pageNum }'">답변</button>
				 			</c:if>
				 			<input type="button" value="목록" class="btn" onclick="location='${conPath}/reivewList.do?pageNum=${param.pageNum }'">			 
		</table>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>