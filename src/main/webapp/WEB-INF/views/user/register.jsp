<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/head.jsp"%>
<script type="text/javascript">
	
$(function(){
	
	$("#idCheckBtn").on("click", function(){
		
		var idregex = /^[a-zA-Z0-9]{4,12}$/; 
		// 영문, 숫자 4자 ~ 12자
		
		var userid = $("#id_input").val();
		
			$.ajax({
				url : "/user/idCheck",
				type : "POST" ,
				dataType : "json",
				data : {"userid" : userid},
				success : function(data){
				
					if(userid != "" && idregex.test(userid.trim()) ){
						
						if(data != 0){
							alert("중복된 아이디 입니다.");
							$('#id_input').val("");
							$('#id_input').focus();
							
						} else if(data == 0){
							$("#idCheck").attr("value","Y");
							alert("사용가능한 아이디 입니다.");
							$("#alert_id").hide();
							$("#idCheck_pass").prop("checked", true);
							$("#idCheckBtn").attr("disabled", true);
							$("#id_input").attr("readonly", "readonly")
							
						} 
					
					} else {
						alert("아이디를 다시 입력해 주세요");
						$('#id_input').val("").focus();
						
					}
					
				},error : function(){
					alert("실패");
				}
				
			}) // end ajax
		
	}); // end fn_idCheck()
	
});	// end ready	


function checks(){
	
	var result = true;
	var pass = $("#pw_input").val();
	var userid = $("#id_input").val();
	
	//  6자 이상 20자미만(비밀번호 정규식)
	var passregex = /^[A-Za-z0-9]{6,20}$/; 

	// 이메일 정규식
	//var emailregex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

	
	// 비밀번호 공백 확인 && 비밀번호 유효성 검사
	if(pass == ""){
		$("#pw_input").focus();
		return false;
	}
	if(!passregex.test(pass)){
		$("#pw_input").focus();
		$("#alert_pass").text("형식이 맞지 않습니다. (영문, 숫자 6자 이상 20자 이하)");
		return false;
		
	} else {
		$("#alert_pass").fadeOut();
	}
	
	// 비밀번호, 비밀번호 확인 일치 여부
	if($("#pw_input").val() != $("#pw_chk_input").val()){
		$("#pw_chk_input").val("").focus();
		$("#alert_pass_check1").show();
		return false;
	}

	// 아이디와 비밀번호 일치할 경우
	if( $("#pw_input").val() == $("#id_input").val()){
		alert("아이디와 비빌번호가 같습니다.");
		$("#pw_input").focus();
		return false;
	}

	// 비밀번호 확인란 공백일 경우
	if ($("#pw_chk_input").val() == "") {
		$("#pw_chk_input").focus();
		$("#alert_pass_check2").show();
		return false;
	}

	// 아이디 중복 체크
	if($("#idCheck_pass").val() != "pass"){
		alert("아이디 중복 확인이 필요합니다");
		return false;
	}
	
	// SNS 인증  validation 
	if($("#kakao").val() != "1"){
		alert("SNS 인증이 필요합니다");
		return false;
	}
	
	// email 정규식 체크
	/* if(!emailregex.test($("#email").val())){
		alert("이메일 확인");
		return false;
	} */ 
	
	// 전화번호 공백일 경우
	if ($("#phone_input").val() == "") {
		$("#phone_input").focus();
		return false;
	}
	
	

	return true;
	
} // end checks()

</script>
<body class = "hold-transition register-page">

	<div class = "register-box">
		<div class = "register-logo"></div>
		
		<div class = "register-box body">
			<p class ="login-box-msg">회원가입 페이지</p>
			<form action="${path}/user/register" method="post" onsubmit="return checks()">
			
			<label>
				SNS 인증<br>
				
				<c:if test="${empty kakao}">
				<button type="button" id="kakao_auth"><a href="https://kauth.kakao.com/oauth/authorize?client_id=fb1d8350db62c7161d16a4c91065256f&redirect_uri=/user/auth&response_type=code">카카오톡 인증</a></button>
				<input type="checkbox" id="kakao" name="auth" value="1" class="form-control" onclick="return false"><br>
				<span>인증이 필요합니다.</span>
				</c:if>
				
				<c:if test="${not empty kakao }">
				<button type="button" id="kakao_auth" disabled="disabled">카카오톡 인증</button>
				<input type="checkbox" id="kakao" name="auth" value="1" class="form-control" checked="checked" onclick="return false"><br>
				</c:if>
				
				
			</label>
			<br><br>
			
			<div id="afterAuth" <c:if test="${empty kakao}">hidden="hidden"</c:if> >
				<div class="form-group has feedback">
					<input id="id_input" type="text" name="userid" class="form-control" placeholder="아이디">
					<span class="glyphicon glyphicon-sign form-control-feedback"></span>
					<button type="button" id="idCheckBtn">중복 확인</button>
					<input type="checkbox" id="idCheck_pass" value="pass" onclick="return false">	
				</div>
			
				<div><span id="alert_id">필수 입력입니다.(영문 4자 이상 12자 이하)</span></div>
					<div class="checkbox icheck">
								
						<div class="form-group has feedback">
							<input type="password" id="pw_input" name="pass" class="form-control" placeholder="비밀번호">
							<span class="glyphicon glyphicon-lock form-control-feedback"></span>	
						</div>
						<div><span id="alert_pass">필수 입력입니다.(6자 이상 20자 이하)</span></div>
						<div class="form-group has feedback">
							<input type="password" id="pw_chk_input" class="form-control" placeholder="비밀번호 확인">
							<span class="glyphicon glyphicon-log-in form-control-feedback"></span>	
						</div>
						<div><span id="alert_pass_check1" style="display: none;" >비밀번호가 일치하지 않습니다.</span></div>
						<div><span id="alert_pass_check2" style="display: none;" >비밀번호 확인란은 입력해주세요.</span></div>
						<div class="form-group has feedback">
							<input type="text" name="name" class="form-control" placeholder="닉네임" readonly="readonly" value="${kakao }">
							<span class="glyphicon glyphicon-user form-control-feedback"></span>	
						</div>
						<div class="form-group has feedback">
							<input type="text" name="email" class="form-control" placeholder="이메일" readonly="readonly" value="${kakao_email }">
							<span class="glyphicon glyphicon-user form-control-feedback"></span>	
						</div>
						<div class="form-group has feedback">
							<input type="text" name="phonenum" class="form-control" id="phone_input" placeholder="전화번호" >
							<span class="glyphicon glyphicon-phone form-control-feedback"></span>	
						</div>
						<div>
							<button type="submit" class="btn">가입하기</button>
						</div>
					
					</div>
				</div>	
			</form>
		
		</div>
		<!-- /.login-box-body -->
	</div>
		<!-- /.login-box -->
	
</body>

</html>
