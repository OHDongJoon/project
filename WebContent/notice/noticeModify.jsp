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
</head>
<body><!-- Nmodify 작성자 id  작성자  제목  본문 -->
	 
	<form action="${conPath }/noticeModify.do" method="post">
	   <input type="hidden" name="pageNum" value="${param.pageNum }">
	   <input type="hidden" name="nid" value="${nContent.nid }">
	    <div class="board_wrap">
        <div class="board_title">
	     <strong>${nContent.nid }번 공지글 수정</strong>
	         <p>공지사항 수정 하세요 </p>
	    </div>
	    <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                  <dl>
                        <dt>제목</dt>
                        <dd><input type="text"  name="atitle" value="${nContent.atitle }" required="required" placeholder="제목 입력"></dd>
                    </dl>
	            </div> <!-- title 제목  -->
	            <div class="info">
	               <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text"  name="aname" value="${nContent.aname }" required="required" placeholder="글쓴이 입력"></dd>
                    </dl>
	                <dl>
                        <dt>아이디</dt>
                        <dd><input type="text"  name="aid" value="${nContent.aid }" required="required" placeholder="비밀번호 입력"></dd>
                    </dl>
	            </div> <!-- info -->
	                <div class="cont">
	                   <textarea placeholder="내용 입력" name = "acontent"   required="required"></textarea>
	                </div>
	            </div> <!--  board_write -->
	                <div class="bt_wrap">
	              		<input type="submit" value="수정" class="btn">
			      		<input type="button" value="목록"  class="btn"onclick="location='${conPath}/NoticeList.do?pageNum=${param.pageNum }'">
	                </div>
	         </div> <!-- board_write_wrap -->
	   </div> <!-- board_wrap -->
	   </form>
</body>
</html>