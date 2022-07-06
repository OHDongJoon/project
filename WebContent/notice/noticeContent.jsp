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
<!-- 	<style>
		#content_form {
			width: 800px; height:470px;
			margin: 30px auto 0px;
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
	</style> -->
</head>
<!-- noticeContent -->
<body>
  <div class="board_wrap">
    <div class="board_title">
            <strong>공지사항</strong>
            <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
             <div class="title">
               ${nContent.atitle }
             </div> <!-- title -->
             <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${nContent.nid }</dd>
                    </dl>
                     <dl>
                        <dt>글쓴이</dt>
                        <dd>${nContent.aname }</dd>
                    </dl>
                     <dl>
                        <dt>작성일</dt>
                        <dd>${nContent.ardate }</dd>
                    </dl>
             </div> <!-- board_view -->
             <div class="cont">
             ${nContent.acontent }
             </div> <!-- cont 본문 -->
             </div> <!-- board_view_wrap -->
          <div class="bt_wrap">
          <c:if test="${admin.aId eq nContent.aid}">
          <input type="button" value="수정" class="btn" onclick="location='${conPath}/noticeModifyView.do?nid=${nContent.nid}&pageNum=${param.pageNum }'">
           <input type="button" value="목록" class="btn" onclick="location='${conPath}/NoticeList.do?pageNum=${param.pageNum }'" >
          </c:if>
           <c:if test="${admin.aId eq nContent.aid or not empty admin }">
            <input type="button" value="삭제"  class="btn" onclick="location='${conPath}/noticeDelete.do?nid=${nContent.nid}&pageNum=${param.pageNum }'">
           </c:if>
           <input type="button" value="목록" class="btn" onclick="location='${conPath}/NoticeList.do?pageNum=${param.pageNum }'" >
           <input type="button" value="홈"  class="btn" onclick="location='${conPath }/main.do'"> <!--<a href="#">수정</a>-->
            </div>
         
          </div> <!-- board_view_wrap -->
          </div>	<!-- board_wrap -->  
</body>
</html>