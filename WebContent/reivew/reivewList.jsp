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
	<link href="${conPath }/css/reivewList.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  	$(document).ready(function(){
  		$('tr').click(function(){
  			var mid = Number($(this).children().eq(0).text());// 0 번째 td안의 있는 text;
  		if(!isNaN(mid)){
  			location.href = '${conPath }/reivewContent.do?mid='+mid+'&pageNum=${pageNum}';
  		}
  		});
  	});
</script>
</head>
<c:if test="${not empty menuReivewResult }">
       <script>
         alert(' ${menuReivewResult } ');
       </script>
    </c:if>
	<div id ="content_form">
	 <table>
	   <tr>
	     <td> 
	       <c:if test="${not empty customer }"><a href="${conPath }/reivewWriteView.do">글쓰기</a></c:if>
		 <c:if test="${empty customer }"><a href="${conPath }/loginView.do">글쓰기는 사용자 로그인 이후에만 가능합니다</a></c:if>
	</td></tr>
	 </table>
	 </div>
	 <br>
	<div class="board_wrap"> <!-- content_form -->
   <div class="board_title"> 
            <strong>후기 </strong>
            <p>후기 보고 가세요 ~</p>
        </div>
    <div class="board_list_wrap"> <!-- table -->
       <div class="board_list">
        
       <div class="top">
	
	       <div class="num">글번호</div>
	       <div class="num">작성자</div>
	       <div class="title">글제목</div>
	       <div class="num">조회수</div>
	       <div class="date">날짜</div>
	      
	       <div class="count">평점</div>
	 </div>
	 <div>
		 <c:if test="${noticetotCnt eq 0 }">
		    	<div class="num"></div>
			    <div class="title">후기가 없습니다</div>
			    <div class="writer"></div>
			    <div class="date"></div>
			    <div class="count"></div>
		</c:if>
		<c:if test="${totCnt != 0 }">
	      <c:forEach items="${reivewList }" var="dto">
	      <div class="num">${dto.mid }</div>
	      <div class="writer"> ${dto.cname }</div>
	        <c:forEach var="i" begin="1" end="${dto.mindent }">
	          <div class="num2">
	            <c:if test="${i==dto.mindent }"> └</c:if>
	            <c:if test="${i != dto.mindent }"> &nbsp; &nbsp; </c:if>
	            
	           </div>
	           </c:forEach>
	         <div class="title"><a href="${conPath }/reivewContent.do?mid=${dto.mid }&pageNum=${pageNum}">${dto.mtitle }</a></div>
      	<div class="num">${dto.mhit }</div>
	      	<div class="date"><fmt:formatDate value="${dto.mrdate }" type="date" dateStyle="short"/></div>
	        
	          <c:forEach var="i" begin="1" end="${dto.star }">
	          <div class="star">
	           <c:if test="${i !=dto.star }"><img  src="${conPath }/img/star.png" width=15px;></c:if>
	           <c:if test="${i == dto.star }"><img src="${conPath }/img/star.png" width=15px;></c:if>
	           </div>
	         </c:forEach>
	            <br>
	      </c:forEach>
	   </c:if>
	 	</div> <!-- div 글목록 -->
	</div>  <!--board_list -->
	  <!-- 페이징 -->
	 <div class ="board_page">
	     <c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/reivewList.do?pageNum=${startPage-1}" class="bt prev"> ◁ </a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				<a href="#" class="num on">[ ${i } ] </a>
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/reivewList.do?pageNum=${i}" class="num"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/reivewList.do?pageNum=${endPage+1}" class="bt next"> ▷ </a> ]
		</c:if>
	 </div>
	  <div class="bt_wrap">
	  <%-- <c:if test="${not empty admin }"><a href="${conPath }/NoticeWriteView.do" class="on">공지글등록</a></c:if> --%>
              <a href="${conPath }/main.do" class="on">홈</a> <!--<a href="#">수정</a>-->
            </div>
	</div> <!--  board_list_wrap-->
	</div><!--  board warp -->
	 
<%-- <jsp:include page="../main/footer.jsp"/> --%>


</body>
</html>