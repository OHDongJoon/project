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
	<link href="${conPath }/css/noticeList.css" rel="stylesheet">
	<style>
	

	</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
		$('tr').click(function(){
			var nid = Number($(this).children().eq(0).text());// 0 번째 td안의 있는 text;
		if(!isNaN(nid)){
			location.href = '${conPath }/noticeContent.do?nid='+nid+'&pageNum=${pageNum}';
		}
		});
	});
</script>
</head>
<body>
	<!--  글쓰기 성공 if noticeList -->
  <c:if test="${not empty noticeWriteResult }">
     <script>
       alert('${noticeWriteResult }');
     </script>
  </c:if>
  <c:if test="${noticeResult eq 1 }">
  	<script>
  		alert('글 수정 성공');
  	</script>
  </c:if>
  <c:if test="${noticeResult eq 0 }">
  	<script>
  		alert('글 수정 실패');
  		history.back();
  	</script>
  </c:if>
  <c:if test="${noticeDeleteResult eq 1 }">
     <script>
      alert('글 삭제 성공');
     </script>
  </c:if>
   <c:if test="${noticeDeleteResult eq 0 }">
     <script>
      alert('글 삭제 실패');
     </script>
  </c:if>

      
 <div class="board_wrap">
   <div class="board_title">
            <strong>공지사항</strong>
            <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
        </div>
    <div class="board_list_wrap">
       <div class="board_list">
       <div class="top">
	     <div class="num">글번호</div>
	     <div class="title">작성자</div>
	     <div class="writer">제목</div>
	     <div class="date">날짜</div>
	     <div class="count">IP</div>
	  </div>  
	  <div>
	     <c:if test="${noticetotCnt==0 }">
         <div>공지글이 없습니다</div>
        </c:if>
        <c:if test="${noticetotCnt != 0 }"> 
         <c:forEach items="${noticeList }" var="dto">
         <div>${dto.nid }</div>
	     <div>${dto.aname }</div>
	     <div><a href="${conPath }/noticeContent.do?nid=${dto.nid }">${dto.atitle }</a></div>
	     <div><fmt:formatDate value="${dto.ardate }" type="date" dateStyle="short"/></div>
          <div> ${dto.aip } </div>
         </c:forEach>
        </c:if> 
	  </div> <!-- 글목록 -->
     </div> <!-- board_list -->
     <!-- 페이징 -->
     <div class="board_page">
     <c:if test="${startPage > BLOCKSIZE }">
			 <a href="${conPath }/NoticeList.do?pageNum=${startPage-1}" class="bt prev">◁</a> 
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				<b> [ ${i } ] </b>
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/NoticeList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/NoticeList.do?pageNum=${endPage+1}" class="bt next"> ▷ </a> ]
		</c:if>
     </div>
   </div> <!--  board_list_wrap-->
 </div> <!--  board warp -->
   
</body>
</html>
<%-- <div id ="content_form">
  <table>
  <tr>
   <td>
     	<c:if test="${not empty admin }"><a href="${conPath }/NoticeWriteView.do">공지글등록</a></c:if>
     </td>
   </tr>
  </table>
  <!-- nid aname atitle rdate aip-->
  <br>
  <table>
  <tr>
     <th>글번호</th>
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
			[ <a href="${conPath }/NoticeList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				<b> [ ${i } ] </b>
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/NoticeList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/NoticeList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
	 </div>
</div> --%>