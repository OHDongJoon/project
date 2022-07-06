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
		#content_form {
			width: 800px; height:470px;
			margin: 30px auto 0px;
		}
		#content_form table tr { height: 10px;}
	</style>
</head>
<body>
<%-- <jsp:include page="../main/header.jsp"/> --%>
   <div class="board_wrap">
    <div class="board_title">
            <strong>후기</strong>
           
        </div>
         <div class="board_view_wrap">
            <div class="board_view">
             <div class="title">
               ${reivew.mtitle }
             </div> <!-- title -->
	    <div class="info">
             <dl>
             <dt>번호</dt>
             <dd>${reivew.mid }</dd>
            </dl>
             
             <dl>
              <dt>글쓴이</dt>
              <dd>${reivew.cname }</dd>
                </dl>
              
               <dl>
               <dt>작성일</dt>
              <dd>${reivew.mrdate }</dd>
               </dl>
               <dl>
               <dt>평점</dt>
              <dd><c:forEach var="i" begin="1" end="${reivew.star }">
	          <c:if test="${i !=reivew.star }"><img src="${conPath }/img/star.png" width=15px;></c:if>
	           <c:if test="${i ==reivew.star }"><img src="${conPath }/img/star.png" width=15px;></c:if>
	         </c:forEach></dd>
               </dl>
            
             </div> <!-- board_view -->
              <div class="cont">
               ${reivew.mcontent }
             </div> <!-- cont 본문 -->
              <div class="cont">
              <c:if test="${not empty reivew.mphoto  }">
	          <img src="${conPath }/reivewPhotoUp/${reivew.mphoto}" width="150">                    
	          </c:if>
	          <c:if test="${empty reivew.mphoto }">
	            		첨부파일없음
	          </c:if> 
             </div> 
             </div> <!--  board_view -->
            
	      
	    
	   
	    
	   <div class="bt_wrap">
	<c:if test="${customer.cId eq reivew.cid }"> 
		<input type ="button" value="수정"  onclick="location='${conPath}/reivewModifyView.do?mid=${reivew.mid }&pageNum=${param.pageNum }'">
		</c:if>
				 			
		<c:if test="${customer.cId eq reivew.cid or not empty admin}">
			<input type="button" value="삭제" onclick="location='${conPath}/reivewDelete.do?mid=${reivew.mid }&pageNum=${param.pageNum }&mgroup=${reivew.mgroup }&mstep=${reivew.mstep }&mindent=${reivew.mindent }'">
		</c:if>
				 			
	<c:if test="${not empty customer }">
		<input type="button" value ="답변" onclick="location='${conPath}/reivewReplyView.do?mid=${reivew.mid }&pageNum=${param.pageNum }'">
			</c:if>
	<input type="button" value="목록" class="btn" onclick="location='${conPath}/reivewList.do?pageNum=${param.pageNum }'">			 
		</div> <!-- bt wrap -->
 </div> <!-- board_view_wrap -->
</div> <!--  board_view_wrap -->

</body>
</html>