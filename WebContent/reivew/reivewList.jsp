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
	<div id ="content_form">
	 <table>
	   <tr>
	     <td> 
	       <c:if test="${not empty customer }"><a href="${conPath }/reivewWriteView.do">글쓰기</a></c:if>
		 <c:if test="${empty customer }"><a href="${conPath }/loginView.do">글쓰기는 사용자 로그인 이후에만 가능합니다</a></c:if>
	</td></tr>
	 </table>
	 <br>
	 <table>
	    <tr>
	       <th>글번호</th>
	       <th>작성자</th>
	       <th>글제목</th>
	       <th>조회수</th>
	       <th>날짜</th>
	      
	       <th>IP</th>
	     </tr>
	     
	   <c:if test="${totCnt==0 }">
	      <tr>
	        <td colspan="6"> 글이 없습니다</td>
	      </tr>
	     </c:if>
	     
	  <c:if test="${totCnt != 0 }">
	      <c:forEach items="${reivewList }" var="dto">
	      
	       <tr>
	         
	            <td>${dto.mid }</td>
	            <td>${dto.cname }</td>
	            
	         <td class="left">
	               <c:forEach var="i" begin="1" end="${dto.mindent }">
	                  <c:if test="${i==dto.mindent }">└</c:if>
	                  <c:if test="${i != dto.mindent }"> &nbsp; &nbsp;</c:if>
	               </c:forEach>
	      		
	      		${dto.mtitle } <!-- 글제목에 a태그를 걸지 말고 query 로 tr을 클릭하면 상세 보기 페이지로 -->
	      			
	         </td>
	         <td>${dto.mhit }</td>
	         <td><fmt:formatDate value="${dto.mrdate }" type="date" dateStyle="short"/></td>
		     <td>${dto.mip }</td>
	       </tr>
	      </c:forEach>
	 </c:if>
	 </table>
	 <div class ="paging">
	     <c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/reivewList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				<b> [ ${i } ] </b>
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/reivewList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/reivewList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
	 </div>
</div>
<jsp:include page="../main/footer.jsp"/>
<%-- <c:if test="${not empty dto.mphoto }">
		      		<img src="https://cdn-icons-png.flaticon.com/512/5088/5088374.png" width="10">
		      	</c:if> --%>
</body>
</html>