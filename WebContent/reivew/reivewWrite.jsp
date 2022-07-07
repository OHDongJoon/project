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
	 <link href="${conPath }/css/reivewWrite.css" rel="stylesheet"> 
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
<div class="board_wrap"> 
        <div class="board_title">
            <strong>후기 작성</strong>
            <p>소중한  후기 감사 합니다.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text"  name="mtitle" required="required" placeholder="제목 입력"></dd>
                    </dl>
                </div> <!-- title -->
              
                <div class="info">
                  <dl>
                      <dt>음식선택</dt>
                     <dd><input type="checkbox" name="foodid" value="1" id="1"><label for="readind">갈치조림</label>
					<input type="checkbox" name="foodid" value="2" id="2"><label for="cooking">두루치기</label>
					<input type="checkbox" name="foodid" value="3" id="3"><label for="exercise">성게미역국</label>
					<br>
					<input type="checkbox" name="foodid" value="4" id="4"><label for="exercise">갈치구이2인</label>   
					<input type="checkbox" name="foodid" value="5" id="5"><label for="exercise">솥밥</label>                 
				    <input type="checkbox" name="foodid" value="6" id="6"><label for="exercise">갈치구이4인</label>                 
					              
                      </dd>
                   </dl>
                   <dl>
                        <dt>첨부파일</dt>
                        <dd><input type="file" name="mphoto"></dd>
                   </dl>
            <div class="review_rating">
            <div class="rating">
              <dl>
              <dd><input type="checkbox" name="star" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="star" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="star" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="star" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="star" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label></dd>
                <dt>평점선택</dt>
            </dl>
            </div> <!-- title_star -->
        </div> <!-- review_rating -->	
     </div> <!-- info -->
        <div class="cont">
                    <textarea placeholder="내용 입력" name = "mcontent" required="required"></textarea>
       </div><!-- connt -->
   </div><!-- board_write -->
    <div class="bt_wrap">
	  <input type="submit" value="글쓰기" class="btn">
       <input type="button" value="목록" class="btn" onclick="location.href='${conPath}/reivewList.do'">				
    </div>	<!-- bt_wrap-->	
    
    </div>	 <!-- board_write_wrap -->	
    </div> <!-- board_wrap -->
</form>
</body>
</html>