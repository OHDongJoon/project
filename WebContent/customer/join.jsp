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
	<link href="${conPath }/css/join.css" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		$('input[name="cId"]').keyup(function(){
			var cId = $('input[name="cId"]').val();
			$.ajax({
				url : '${conPath}/idConfirm.do',
				type : 'get',
				dataType : 'html',
				data : "cId="+cId,
				success : function(data){
					$('#idConfirmResult').html(data);
				}
			});//ajax
		});// mId keyup 이벤트
		$('input[name="cPw"], input[name="cPwChk"]').keyup(function(){
			var cPw = $('input[name="cPw"]').val();
			var cPwChk = $('input[name="cPwChk"]').val();
			if(cPw == cPwChk){
				$('#pwChkResult').text('비밀번호 일치');
			}else{
				$('#pwChkResult').html('<b>비밀번호 불일치</b>');
			}
		}); // pw check
		$('input[name="cEmail"]').keyup(function(){
			var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
			var cEmail = $('input[name="cEmail"]').val();
			if(patternMail.test(cEmail)){
				$.ajax({
					url : '${conPath}/emailConfirm.do',
					type : 'get',
					dataType : 'html',
					data : "cEmail="+cEmail,
					success : function(data){
						$('#emailConfirmResult').html(data);
					}
				});//ajax
			}else if(!cEmail){
				$('#emailConfirmResult').html(' &nbsp; ');
			}else{
				$('#emailConfirmResult').html('메일 형식을 지켜주세요');
			}//if
		});// mEmail keyup 이벤트
		$('form').submit(function(){
			var idConfirmResult = $('#idConfirmResult').text().trim();
			var pwChkResult     = $('#pwChkResult').text().trim();
			var emailConfirmResult = $('#emailConfirmResult').text().trim();
			if(idConfirmResult!='사용 가능한 ID'){
				alert('사용가능한 ID로 가입하세요');
				$('input[name="cId"]').focus();
				return false;
			}else if(pwChkResult !='비밀번호 일치'){
				alert('비밀번호를 확인하세요');
				$('input[name="cPw"]').focus();
				return false;
			}else if(emailConfirmResult!='' && emailConfirmResult != '사용 가능한 메일입니다'){
				alert('이메일을 확인하세요');
				$('input[name="cEmail"]').focus();
				return false;
			}
		});
	});//mIdConfirm의 click이벤트
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
	
	<form action="${conPath }/join.do" method="post" >
	<div class="container">
	<div class="insert">	
		<table>
			<caption>회원가입</caption>
			<tr>
				 <td class="col1">이름</td>
				 <td class="col2">
				 <input type="text" name="cName" required="required">
				 </td>
			</tr>
			<tr>
			 <td class="col1">아이디</td>
			  <td class="col2">
			  <input type="text" name="cId" required="required">
			  <div id="idConfirmResult"> &nbsp; </div>
			 </td>
			</tr>
			<tr>
			  <td class="col1">비밀번호</td>
			  <td class="col2">
			  <input type="password" name="cPw" required="required">
			  </td>
			</tr>
			<tr>
			<td class="col1">확인비밀번호</td>
					<td class="col2">
						<input type="password" name="cPwChk" required="required">
						<div id="pwChkResult"> &nbsp; </div>
					</td>
			</tr>
			
			<tr>
			<td class="col1">메일</td>
			   <td class="col2">
			   <input type="email" name="cEmail">
			  <div id="emailConfirmResult"> &nbsp;</div>
			</td>
			</tr>
			<tr>
			<td class="col1">생년월일</td>
			<td class="col2">
			<input type="text" name="cBirth" id="cBirth"></td>
			</tr>
			<tr>
			  <td class="col1">주소</td>
			  <td class="col2">
			    <input type="text" name="cAddress"></td></tr>
			</table>
			</div>
			<div class="create">
			<input class="but3" type="submit" value="회원가입" >
			<input class="but4" type="button" value="뒤로가기" onclick="history.go(-1)">
		</div>
		</div>
	</form>
</body>
</html>