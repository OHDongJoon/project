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
	 <link href="${conPath }/css/reivew.css" rel="stylesheet"> 
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
	
	<style >
	
	</style>
	<!--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	  	$(document).ready(function(){
	  		$('#rating5').click(function(){
	  			if($(this).checked()){
	  				
	  			}
	  		});
	  	});
  	</script>-->
  	
</head>
<!-- foodid(메뉴) , mtitle(제목) mcontent(본문) , 평점 star  -->
<body>
<form action="${conPath }/reivewWrite.do" method="post" enctype="multipart/form-data">
<div class="wrap">
        <div class="review_rating">
          <h1> 후기 작성  </h1>
          <p class="title_star">별점과 리뷰를 남겨주세요.</p>
            <div class="rating">
          	
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
			<table>
				
			  <tr>
				
				<td>
					<input type="checkbox" name="foodid" value="1" id="1"><label for="readind">갈치조림</label>
					<input type="checkbox" name="foodid" value="2" id="2"><label for="cooking">두루치기</label>
					<input type="checkbox" name="foodid" value="3" id="3"><label for="exercise">성게미역국</label>
					<input type="checkbox" name="foodid" value="4" id="4"><label for="exercise">갈치구이</label>
					
				</td>
			</tr>
				<tr>
				<td>제목</td>
				   <td><input type="text" name="mtitle" required="required" size="30">
				     </td>
				</tr>
				<tr><td>본문</td>
				  <td><input type="text" name="mcontent" required="required" size="32">
				  </td>
				  </tr>
				<tr><td>첨부파일</td><td><input type="file" name="mphoto"></td></tr>
				


				</table>

				<div class="create">
							<input type="submit" value="글쓰기" class="btn">
							<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/reivewList.do'">
		
		        </div>
		
		</form>
			
	
	
</body>
</html>