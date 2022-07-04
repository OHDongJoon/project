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
	<%-- <link href="${conPath }/css/style.css" rel="stylesheet"> --%>
	<style >
	.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('../img/starrate.png') ;
    
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}

	</style>
</head>
<!-- foodid(메뉴) , mtitle(제목) mcontent(본문) , 평점 star  -->
<body>
<div id="content_form">

		<form action="${conPath }/reivewWrite.do" method="post" enctype="multipart/form-data">
			<table>
				<caption>후기쓰기</caption>
			  <tr>
				<td> 후기 음식 </td>
				<td>
					<input type="checkbox" name="foodid" value="1" id="1"><label for="readind">갈치조림</label>
					<input type="checkbox" name="foodid" value="2" id="2"><label for="cooking">두루치기</label>
					<input type="checkbox" name="foodid" value="3" id="3"><label for="exercise">갈치구이</label>
				</td>
			</tr>
				<tr><td>제목</td><td><input type="text" name="mtitle"
								required="required" size="30"></td></tr>
				<tr><td>본문</td><td><textarea name="mcontnet" rows="3" 
								cols="32"></textarea></td></tr>
				<tr><td>첨부파일</td><td><input type="file" name="mphoto"></td></tr>
		</table>		
				
						<!-- <input type="checkbox" name="start" value="1" id="start1"><label for="start1">별</label>
			
						<input type="checkbox" name="start" value="1" id="start1"><label for="start1">별</label> -->
<table>
<div class="wrap">
    <h1>후기</h1>
  
        <input type="hidden" name="rate" id="rate" value="0"/>
        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
 
        <div class="review_rating">
           
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="star" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="star" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="star" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="star" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="star" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>			
							
			
</div>					
				

				<tr><td colspan="2">
							<input type="submit" value="글쓰기" class="btn">
							<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/reivewList.do'">
			</table>
		</form>
	</div>
</body>
</html>