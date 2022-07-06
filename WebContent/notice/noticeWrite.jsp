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
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력" name = "acontent" required="required"></textarea>
                </div>
            </div>
             <div class="bt_wrap">
             
                <input type="submit" class="on" value="글쓰기">
                <a href="${conPath }/NoticeList.do" class="on">목록</a>
            </div>
          </div>
      <%--  <tr>
         <th>작성자id</th>
           <td><input type="text" name="aid" required="required"></td>
         <th>작성자</th>
           <td><input type="text" name="aname" required="required"></td>
       </tr>
       <tr>
         <th>제목</th>
           <td><input type="text" name="atitle" required="required"></td>
       </tr>
       <tr>
         <th>본문</th>
           <td><textarea rows="5" cols="20" name = "acontent"></textarea></td>
       </tr>
       <tr>
         <td colspan="2">
           <input type="submit" value="글쓰기" class="btn">
           <input type="reset" value="초기화" class="btn">
           <input type="button" value="목록" onclick="location='${conPath}/NoticeList.do'">
         </td>
        </tr>
     </table> --%>
   </form>	
</body>
</html>