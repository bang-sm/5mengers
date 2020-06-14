<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/head.jsp"%>
<link rel="stylesheet" href="../resources/css/register.css">
<script type="text/javascript">
	$(function() {

		$("#idCheckBtn").on("click", function() {

			var idregex = /^[a-zA-Z0-9]{4,12}$/;
			// 영문, 숫자 4자 ~ 12자

			var userid = $("#id_input").val();

			$.ajax({
				url : "/user/idCheck",
				type : "POST",
				dataType : "json",
				data : {
					"userid" : userid
				},
				success : function(data) {

					if (userid != "" && idregex.test(userid.trim())) {

						if (data != 0) {
							alert("중복된 아이디 입니다.");
							$('#id_input').val("");
							$('#id_input').focus();

						} else if (data == 0) {
							$("#idCheck").attr("value", "Y");
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

				},
				error : function() {
					alert("실패");
				}

			}) // end ajax

		}); // end fn_idCheck()

	}); // end ready	

	function checks() {

		var result = true;
		var pass = $("#pw_input").val();
		var userid = $("#id_input").val();

		//  6자 이상 20자미만(비밀번호 정규식)
		var passregex = /^[A-Za-z0-9]{6,20}$/;

		// 이메일 정규식
		//var emailregex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

		// 비밀번호 공백 확인 && 비밀번호 유효성 검사
		if (pass == "") {
			$("#pw_input").focus();
			return false;
		}
		if (!passregex.test(pass)) {
			$("#pw_input").focus();
			$("#alert_pass").text("형식이 맞지 않습니다. (영문, 숫자 6자 이상 20자 이하)");
			return false;

		} else {
			$("#alert_pass").fadeOut();
		}

		// 비밀번호, 비밀번호 확인 일치 여부
		if ($("#pw_input").val() != $("#pw_chk_input").val()) {
			$("#pw_chk_input").val("").focus();
			$("#alert_pass_check1").show();
			return false;
		}

		// 아이디와 비밀번호 일치할 경우
		if ($("#pw_input").val() == $("#id_input").val()) {
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
		if ($("#idCheck_pass").val() != "pass") {
			alert("아이디 중복 확인이 필요합니다");
			return false;
		}

		// SNS 인증  validation 
		if ($("#kakao").val() != "1") {
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
<body class="hold-transition register-page">
	
	<div class="register-box">
		<div class="site__container">
			<div class="register-box body">
				<h2 class="login-box-msg">JOIN US</h2>
				<form action="${path}/user/register" method="post" onsubmit="return checks()" class="form form--register">
					
					<div class="boardWrite">
						<table border="1" summary="">
							<caption></caption>

							<tr>
									<th scope="row">SNS 인증 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수">
									</th>
									<td class="noPadding">
										<c:if test="${empty kakao}">
											<button type="button" id="kakao_auth">
												<a href="${kakao_uri}/user/auth&response_type=code">카카오톡 인증</a>
											</button>
											<!-- 여기에 인증 버튼  -->
											<input type="checkbox" id="kakao" name="auth" value="1"
											onclick="return false" class="form__input">
											<span>인증이 필요합니다.</span>
										</c:if>
										<c:if test="${not empty kakao }">
											<button type="button" id="kakao_auth">
												<a href="${kakao_uri}/user/auth&response_type=code">카카오톡 인증</a>
											</button>
											<!-- 여기에 인증 버튼  -->
											<input type="checkbox" id="kakao" name="auth" value="1" checked="checked"
												onclick="return false" class="form__input">
										</c:if>
									</td>
								</tr>
							
							<tbody <c:if test="${empty kakao}">hidden="hidden"</c:if>>
								<tr>
									<th scope="row">아이디 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수">
									</th>
									<td class="noPadding"><input id="id_input" name="userid"
										 class="inputTypeText" type="text"> 
										<button type="button" id="idCheckBtn">중복 확인</button>
										<input type="checkbox" id="idCheck_pass" value="pass"
											onclick="return false" class="form__input">
										<span id="alert_id">필수 입력입니다.(영문,숫자 4자 이상 12자 이하)</span>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수"></th>
									<td><input id="pw_input" name="pass"									
										 autocomplete="off" maxlength="16"
										 type="password"> 
										<span id="alert_pass">필수 입력입니다.(영문,숫자 6자 이상 20자 이하)</span></td>
								</tr>
								<tr>
									<th scope="row">비밀번호 확인 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수"></th>
									<td><input id="pw_chk_input" 					
										 autocomplete="off" maxlength="16"
										disabled" value="" type="password">
										<span id="alert_pass_check1" style="display: none;">비밀번호가
											일치하지 않습니다.</span>
										<span id="alert_pass_check2" style="display: none;">비밀번호
											확인란은 입력해주세요.</span>
									</td>
								</tr>
								<tr>
									<th scope="row" id="nameTitle">이름 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수"></th>
									<td><input type="text" name="name" id="name" readonly="readonly" value="${kakao }">
										</td>
								</tr>

								<tr class="displaynone">
									<th scope="row">휴대전화 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										id="icon_phone"></th>
									<td><input id="phone_input" name="phonenum" 
										 value="" type="text"></td>
								</tr>
								<tr>
									<th scope="row">이메일 <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
										alt="필수"></th>
									<td><input name="email" 
										 value="${kakao_email }" type="text" readonly="readonly"> 
									</td>
								</tr>
								
							</tbody>
						</table>
							<div>
								<button id="submitBtn" type="submit" class="btn" <c:if test="${empty kakao}">hidden="hidden"</c:if>>가입하기</button>
							</div>
					</div>
				</form>
			</div>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
	
</body>

</html>

