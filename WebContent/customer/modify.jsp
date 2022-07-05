<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/join.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
$(document).ready(function(){
	$('input[name="cEmail"]').keyup(function(){
		var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
		var cEmail = $('input[name="cEmail"]').val();
		if((cEmail == '${customer.cEmail }')){
			$('#emailConfirmResult').html('변경안할거구만');
		}else if(patternMail.test(cEmail) ){
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
		var emailConfirmResult = $('#emailConfirmResult').text().trim();
		if(emailConfirmResult!='' && emailConfirmResult != '사용 가능한 메일입니다' && emailConfirmResult != '변경안할거구만'){
			alert('중복된 이메일은 수정불가합니다');
			$('input[name="cEmail"]').focus();
			return false;
		}
	});
});

</script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#cBirth").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					showMonthAfterYear : true,
					yearSuffix : '년', // "2020년 3월"
					showOtherMonths : true,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
					minDate : '-100y', // 현재 날짜로부터 100년 이전까지 표시
					maxDate : 'y', // 현재 날짜이전까지만 표시
					yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
				});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/modify.do" method="post">
			<div class="container">
				<div class="insert">
					<table>
						<caption>정보수정</caption>
						<tr>
							<td class="col1">아이디</td>
							<td class="col2"><input type="text" name="cId"
								value="${customer.cId }" required="required"></td>
						</tr>
						<tr>
							<td class="col1">비밀번호</td>
							<td class="col2"><input type="password" name="cPw"
								value="${customer.cPw }" required="required"></td>
						</tr>

						<tr>
							<td class="col1">이름</td>
							<td class="col2"><input type="text" name="cName"
								value="${customer.cName }" required="required"></td>
						</tr>
						<tr>
							<td class="col1">메일</td>
							<td class="col2"><input type="email" name="cEmail"
								value="${customer.cEmail }">
								<div id="emailConfirmResult">&nbsp;</div>
						</tr>
						<tr>
							<td class="col1">생년월일</td>
							<td class="col2"><input type="text" name="cBirth"
								id="cBirth" value="${customer.cBirth }"></td>
						</tr>
						<tr>
							<td class="col1">주소</td>
							<td class="col2"><input type="text" name="cAddress"
								value="${customer.cAddress }"></td>
						</tr>
					</table>
				</div>
				<div class="create">
					<input type="submit" value="정보수정" class="but3"> 
					<input type="reset" value="초기화" class="but4"> 
					<input type="button" value="회원탈퇴"onclick="location.href='${conPath }/withdrawalView.do'"class="but4">
					<input class="but4" type="button" value="뒤로가기" onclick="history.go(-1)">
					

				</div>
			</div>
		</form>
	</div>
</body>
</html>