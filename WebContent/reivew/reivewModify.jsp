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
	
	<form action="${conPath }/ReivewModify.do" method="post" enctype="multipart/form-data">
	   <input type="hidden" name="pageNum" value="${param.pageNum }">
	   <input type="hidden" name="mid" value="${reivewModify.mid }">
	   <input type="hidden" name="dbMphoto" value="${reivewModify.mphoto }">
	    <div class="board_wrap">
         <div class="board_title">
	     <strong>${reivewModify.mid }글 리뷰  수정  </strong>
		</div>
	    <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                <dl>
                        <dt>제목</dt>
                        <dd><input type="text"  name="mtitle" value="${reivewModify.mtitle }" required="required" placeholder="제목 입력"></dd>
                    </dl>
	            </div> <!-- title 제목  -->
	            <div class="info">
	      <dl>
             <dt>메뉴사진</dt>
	           <dd><input type="file" name="mphoto">
		       <c:if test="${not empty menuContent.mphoto  }">
	           <img src="${conPath }/reivewPhotoUp/${reivewModify.mphoto }"  width="150">
	           </c:if> 
	           </dd>
          </dl>
           </div><!-- info -->
           <div class="cont">
              <textarea placeholder="내용 입력" name = "mcontent"   required="required"></textarea>
           </div><!-- cont -->
           </div><!--board_write  -->
            <div class="bt_wrap">
	              		<input type="submit" value="수정" class="btn">
			      		<input type="button" value="목록"  class="btn"onclick="location='${conPath}/reivewList.do?pageNum=${param.pageNum }'">
	         </div>
	    
		    </div> <!-- board_write_wrap -->
		    </div> <!-- board_wrap -->
		
	   </form>
	
</body>
</html>