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
	* {
    margin: 0;
    padding: 0;
}
form {
	
	width: 1000px;
	margin: 0 auto;
}

html {
    font-size: 10px;
}

ul, li {
    list-style: none;
}

a {
    text-decoration: none;
    color: black;
}

.board_wrap {
    width: 1000px;
    margin: 160px auto;
}

.board_title {
    margin-bottom: 30px;
}

.board_title strong {
    font-size: 3rem;
}

.board_title p {
    margin-top: 5px;
    font-size: 1.4rem;
}

.bt_wrap {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.bt_wrap a {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1.4rem;
}
.bt_wrap input[type="submit"]{
	display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1.4rem;
     background: #000;
    color: #fff;
}
.bt_wrap input[type="button"]{
	display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1.4rem;
     background: #000;
    color: #fff;
}
.bt_wrap a:first-child {
    margin-left: 0;
}

.bt_wrap a.on {
    background: #000;
    color: #fff;
}

.board_list {
    width: 100%;
    border-top: 2px solid #000;
}

.board_list > div {
    border-bottom: 1px solid #ddd;
    font-size: 0;
}

.board_list > div.top {
    border-bottom: 1px solid #999;
}

.board_list > div:last-child {
    border-bottom: 1px solid #000;
}

.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 1.4rem;
}

.board_list > div.top > div {
    font-weight: 600;
}

.board_list .num {
    width: 10%;
}

.board_list .title {
    width: 60%;
    text-align: left;
}

.board_list .top .title {
    text-align: center;
}

.board_list .writer {
    width: 10%;
}

.board_list .date {
    width: 10%;
}

.board_list .count {
    width: 10%;
}
 .board_page {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}
 .board_page b {
   color: red;
 }
.board_page a {
    display: inline-block;
    width: 32px;
    height: 32px;
    box-sizing: border-box;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-left: 0;
    line-height: 100%;
}

.board_page a.bt {
    padding-top: 10px;
    font-size: 1.2rem;
    letter-spacing: -1px;
}

.board_page a.num {
    padding-top: 9px;
    font-size: 1.4rem;
}

.board_page a.num.on {
    border-color: #000;
    background: #000;
    color: #fff;
}

.board_page a:first-child {
    border-left: 1px solid #ddd;
}
 
.board_view {
    width: 100%;
    border-top: 2px solid #000;
}

.board_view .title {
    padding: 20px 15px;
    border-bottom: 1px dashed #ddd;
    font-size: 2rem;
}

.board_view .info {
    padding: 15px;
    border-bottom: 1px solid #999;
    font-size: 0;
}

.board_view .info dl {
    position: relative;
    display: inline-block;
    padding: 0 20px;
}

.board_view .info dl:first-child {
    padding-left: 0;
}

.board_view .info dl::before {
    content: "";
    position: absolute;
    top: 1px;
    left: 0;
    display: block;
    width: 1px;
    height: 13px;
    background: #ddd;
}

.board_view .info dl:first-child::before {
    display: none;
}

.board_view .info dl dt,
.board_view .info dl dd {
    display: inline-block;
    font-size: 1.4rem;
}

.board_view .info dl dt {

}

.board_view .info dl dd {
    margin-left: 10px;
    color: #777;
}

.board_view .cont {
    padding: 15px;
    border-bottom: 1px solid #000;
    line-height: 160%;
    font-size: 1.4rem;
}

.board_write {
    border-top: 2px solid #000;
}

.board_write .title,
.board_write .info {
    padding: 15px;
}

.board_write .info {
    border-top: 1px dashed #ddd;
    border-bottom: 1px solid #000;
    font-size: 0;
}

.board_write .title dl {
    font-size: 0;
}

.board_write .info dl {
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 1.4rem;
}

.board_write .title dt,
.board_write .info dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
}

.board_write .title input[type="text"],
.board_write .info input[type="text"],
.board_write .info input[type="password"] {
    padding: 10px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 1px solid #000;
    
}
 .board_write .cont textarea {
        display: block;
        width: 100%;
        height: 300px;
        padding: 15px;
        box-sizing: border-box;
        border: 0;
        resize: vertical;
    }
	</style>
</head>
<body>
 	<jsp:include page="../main/header.jsp" />
 
    <div class="board_wrap">
    <div class="board_title">
            <strong>후기 </strong>
             
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
	          <img src="${conPath }/reivewPhotoUp/${reivew.mphoto}" width="300">                    
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