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
<body>
<form action="${conPath }/NoticeWrite.do" method="post">
      <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항</strong>
            <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
        </div>
      
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text"  name="atitle" required="required" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text"  name="aname"  required="required" placeholder="글쓴이 입력"></dd>
                    </dl>
                    <dl>
                        <dt>아이디</dt>
                        <dd><input type="text"  name="aid" required="required" placeholder="비밀번호 입력"></dd>
                    </dl>
                </div><!-- info -->
                <div class="cont">
                    <textarea placeholder="내용 입력" name = "acontent" required="required"></textarea>
                </div><!-- connt -->
            </div><!-- board_write -->
             <div class="bt_wrap">
             
                <input type="submit" class="on" value="글쓰기">
                <input type="button" value="목록"  class="btn"onclick="location='${conPath}/NoticeList.do?pageNum=${param.pageNum }'">
            </div>
          </div>
           </div>
     
   </form>	
</body>
</html>