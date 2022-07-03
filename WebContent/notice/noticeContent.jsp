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
	</style>
</head>
<!-- noticeContent -->
<body>
  <div id="content_form">
    <table>
       <caption>${nContent.aname } 관리자 글</caption>
         <tr>
           <th>제목</th>
           <td>${nContent.atitle }</td>
         </tr>
         <tr>
           <th>본문</th>
           <td><pre>${nContent.acontent }</pre>
        <tr>
           <td colspan="3" > 
          
             <c:if test="${admin.aId eq nContent.aid}">
                <button onclick="location='${conPath }/noticeModifyView.do?nid=${nContent.nid}&pageNum=${param.pageNum }'">수정</button>
             </c:if>
           <c:if test="${admin.aId eq nContent.aid or not empty admin }">
               <button onclick="location='${conPath}/noticeDelete.do?nid=${nContent.nid}&pageNum=${param.pageNum }'">삭제</button>
           </c:if>
          <input type="button" value="목록" class="btn"
          onclick="location='${conPath}/NoticeList.do?pageNum=${param.pageNum }'">
    </table>
  </div>	
</body>
</html>