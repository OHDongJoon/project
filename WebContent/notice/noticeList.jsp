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
			margin: 300px auto 0px;
		}
		#content_form table tr { height: 10px;}
		#content_form table {border: 2px solid pink; width:90%; margin: 0px auto;}
#content_form table tr { background-color: #FFE271; height:40px; }
#content_form table tr:hover { background-color: orange;
	cursor: pointer;
}
#content_form td, #content_form th {text-align: center; padding:5px; }
#content_form caption {font-size: 18px; padding:10px;}
#content_form h2, #content_form b{text-align: center; color:red;}
#content_form a { text-decoration: none; color:black}
#content_form .left{text-align: left;}
#content_form .paging {text-align: center;}
#content_form input:not(.btn), #content_form textarea {
	width: 90%;
}
	</style>
</head>
<body>
	<!--  글쓰기 성공 if noticeList -->
  <c:if test="${not empty noticeWriteResult }">
     <script>
       alert('${noticeWriteResult }');
     </script>
  </c:if>
   ${noticeList }
<jsp:include page="../main/header.jsp"/>
<div id ="content_form">
  <table>
  <tr>
   <td>
     	<c:if test="${not empty admin }"><a href="${conPath }/NoticeWriteView.do">공지글등록</a></c:if>
     </td>
   </tr>
  </table>
  <br>
  <table>
  <tr>
     <th>글번호</th><!-- nid aname atitle rdate aip-->
     <th>작성자</th>
     <th>제목</th>
     <th>날짜</th>
     <th>IP</th>
    
    </tr>
   
   
    <c:if test="${noticetotCnt==0 }">
      <tr>
        <td colspan="6"> 공지글이 없습니다</td>
       </tr>
    </c:if>
    <!-- noticeList -->
   <c:if test="${noticetotCnt != 0 }">
   
      <c:forEach items="${noticeList }" var="dto">
	       <tr>
	            <td>${dto.nid }</td>
	            <td>${dto.aname }</td>
	      		<td>${dto.atitle }</td>
		     <td><fmt:formatDate value="${dto.ardate }" type="date" dateStyle="short"/></td>
		     <td>${dto.aip }</td>
	       </tr>
	      </c:forEach>
   </c:if>
   </table>
 <div class ="paging">
	     <c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/boardList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				<b> [ ${i } ] </b>
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/boardList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/boardList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
	 </div>
</div>
</body>
</html>