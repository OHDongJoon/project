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
<script>
  $('input[name="cEmail"]').keyup(function(){
	  var mEmail = $('input[name="cEmail"]').val();
		$.ajax({
			url : '${conPath}/mailConfirm.do',
			data : 'cEmail='+mEmail,
			type : 'get',
			dataType : 'html',
			success : function(data){
				$('#emailConfirmResult').html(data); // 사용가능한 이메일
			}
		});// ajax함수
	});// keyup 이벤트
	$('form').submit(function(){
		var emailConfirmResult = $('#emailConfirmResult').text().trim();
		if(emailConfirmResult!='' && emailConfirmResult != '사용 가능한 메일입니다'){
			alert('중복된 이메일은 수정불가합니다');
			$('input[name="cEmail"]').focus();
			return false;
		}
	});
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#cBirth" ).datepicker({
    	dateFormat : 'yy-mm-dd',
    	changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
    	monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	showMonthAfterYear : true,
    	yearSuffix : '년', // "2020년 3월"
    	showOtherMonths : true,
    	dayNamesMin:['일','월','화','수','목','금','토'],
			changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
			minDate : '-100y', // 현재 날짜로부터 100년 이전까지 표시
			maxDate : 'y', // 현재 날짜이전까지만 표시
			yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
    });
  } );
  </script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<form action="${conPath }/modify.do" method="post" >
		<table>
			<caption>회원가입</caption>
			<tr><th>아이디</th>
					<td>
						<input type="text" name="cId" value="${customer.cId }" required="required">
					</td>
			</tr>
			<tr><th>비밀번호</th>
					<td><input type="password" name="cPw" value="${customer.cPw }" required="required"></td>
			</tr>
			
			<tr><th>이름</th>
					<td><input type="text" name="cName" value="${customer.cName }" required="required"></td>
			</tr>
			<tr>
			<th>메일</th>
			   <td><input type="email" name="cEmail" value="${customer.cEmail }">
			  <div id="emailConfirmResult"> &nbsp; </div>
			</td>
			</tr>
			<tr><th>생년월일</th><td><input type="text" name="cBirth" id="cBirth" value="${customer.cBirth }"></td></tr>
			<tr><th>주소</th><td><input type="text" name="cAddress" value="${customer.cAddress }"></td></tr>
			<tr><td colspan="4">
						<input type="submit" value="정보수정" class="btn">
						<input type="reset" value="초기화" class="btn">
						<input type="button" value="이전" onclick="history.go(-1)" class="btn">
						<input type="button" value="회원탈퇴" 
								onclick="location.href='${conPath }/withdrawalView.do'" class="btn">	
		    </td>
		    </tr>
		</table>
	</form>
	</div>
</body>
</html>