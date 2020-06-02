<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%--@ include file ="헤드 경로" --%>
<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-box-body">
		<p class="login-box-msg"> 로그인 페이지 </p>
		
		<form action="${path}/user/loginPost" method="post">
			<div class="form-group has feedback">
				<input type="text" name="userid" class="form-control" placeholder="아이디">
			</div>
			<div class="form-group has feedback">
				<input type="password" name="password" class="form-control" placeholder="비밀번호">
			</div>
			
			<div>
				<button type="submit"> 로그인 </button>
			</div>
			
			<div class="row">
				<div class="col-xs-8">
					<div class="checkbox icheck">
					<label>
						<input type="checkbox" name="useCookie"> 로그인 유지
					</label>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="registerbtn">
						<label>
							<button><a href="${path}/user/register"> 회원가입 </a></button>
						</label>
					</div>
				</div>
			</div>
			
		</form>
	</div>
</div>

<script>

	var msg = "${msg}";
	if{msg === "REGISTERED"} {
		alert("회원가입이 완료되었습니다. 로그인 해주세요!");
		
	} else if {
		alert("아이디와 비밀번호를 확인해주세요");
	}

</script>


</body>
</html>