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
   <div id="content_form">
	<form action="${conPath }/MenuModify.do" method="post" enctype="multipart/form-data">
	   <input type="hidden" name="pageNum" value="${param.pageNum }">
	   <input type="hidden" name="foodid" value="${menuContent.foodid }">
	   <input type="hidden" name="dbAphoto" value="${menuContent.aphoto }">
	   <div class="board_wrap"> 
     <div class="board_title">
	  <strong>메뉴 수정</strong>
        </div> <!-- baord title -->
	   <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>메뉴이름</dt>
                        <dd><input type="text"  name="menuname" value="${menuContentt.menuname }" required="required" placeholder="제목 입력"></dd>
                    </dl>
                </div>
	        <div class="info">
	         
	          <dl>
	              <dt>메뉴가격</dt>
	              <dd><input type="text" name="menuprice" value="${menuContentt.menuprice}" required="required"></dd>
	          </dl>
	          
	          <dl>
	             <dt>메뉴사진</dt>
		             <dd><input type="file" name="aphoto" required="required"></dd>
	          </dl>
	        </div> <!-- info -->
	        <div class="cont">
             <textarea placeholder="내용 입력" name="foodcontent" required="required"></textarea>
	         </div>
	      </div><!-- board_write -->
	     <div class="bt_wrap">
	       <input type="submit" value="메뉴수정">
	      <input type="button" value="이전" onclick="history.go(-1)" class="btn">
          </div>

</div><!-- board_write_wrap -->
</div><!-- board_wrap --> 
	   </form>
	</div>
</body>
</html>