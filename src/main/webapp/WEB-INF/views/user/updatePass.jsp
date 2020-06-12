<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<script type="text/javascript">

/*	$(document).ready(function(){
		
		$("#updatePassbtn").click(function(){
			alert("눌림?");
			
			var formdata = $("#form1").serialize();
			
			$.ajax({
				url : "/user/updatePass"
				, type : "POST"
				, cache: false
				, data : formdata
				, success : function (data) {
					var jsonObj = JSON.parse(data);
					
				} // end ajax success function
				, error : function name(xhr ,status) {
					alert(xhr + " : " + status );
					
				}  // end ajax error 
				
			}) // end ajax
			
		}); // click #updatePassbtn
		
	}); // end document ready */


	
	function checks() {
		var pass = $("#newPass_input").val();
		var passregex = /^[A-Za-z0-9]{6,20}$/; 
		
		// 비밀번호 공백 확인 && 비밀번호 유효성 검사
		if(pass == ""){
			$("#newPass_input").focus();
			return false;
		}
		
		if(!passregex.test(pass)){
			$("#newPass_input").focus();
			$("#alert_pass").text("형식이 맞지 않습니다. (영문, 숫자 6자 이상 20자 이하)");
			return false;
			
		} else {
			$("#alert_pass").fadeOut();
		}
		
		// 비밀번호, 비밀번호 확인 일치 여부
		if($("#newPass_input").val() != $("#newPass_confirm").val()){
			$("#newPass_confirm").val("").focus();
			$("#alert_pass_check1").show();
			return false;
		}
		
		// 비밀번호 확인란 공백일 경우
		if ($("#newPass_confirm").val() == "") {
			$("#newPass_confirm").focus();
			$("#alert_pass_check2").show();
			return false;
		}
		
		// 아이디와 비밀번호 일치할 경우
		if( $("#newPass_input").val() == $("#newPass_id").val()){ // session 에서 아이디 가져오기
			alert("아이디와 비빌번호가 같습니다.");
			$("#newPass_input").focus();
			return false;
		}
		
		return true;
		
	}

</script>

<body>

<div>
	<h2>비밀번호 변경</h2>
	<form id="form1" action="/user/updatePass" method="POST" onsubmit="return checks()">
		
		<div>
			<input type="text" id="newPass_id" name="userid" value="${login.userid }" hidden="hidden">
			
		</div>
		<div>
		<input type="password" id="newPass_input" name="pass" placeholder="새로운 비밀번호">
			<div><span id="alert_pass">필수 입력입니다.(6자 이상 20자 이하)</span></div>
		</div>
		<div>
		<input type="password" id="newPass_confirm" placeholder="새로운 비밀번호 확인">
			<div><span id="alert_pass_check1" style="display: none;" >비밀번호가 일치하지 않습니다.</span></div>
			<div><span id="alert_pass_check2" style="display: none;" >비밀번호 확인란은 입력해주세요.</span></div>
		</div>
		
		<button type="submit" id="updatePassbtn" >비밀번호 변경</button>
	</form>

</div>

</body>
</html>