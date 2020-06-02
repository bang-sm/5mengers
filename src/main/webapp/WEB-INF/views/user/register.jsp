<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%--@ include file ="헤드 경로" --%>

<body class = "hold-transition register-page">

	<div class = "register-box">
		<div class = "register-logo"></div>
		
		
		<div class = "register-box body">
			<p class ="login-box-msg">회원가입 페이지</p>
			
			<form action="${path}/user/register" method="post">
				<div class="form-group has feedback">
					<input type="text" name="userid" class="form-control" placeholder="아이디">
					<span class="glyphicon glyphicon-sign form-control-feedback"></span>	
				</div>
				<div class="checkbox icheck">
					<label>
						<input type="checkbox" name="auth" class="form-control"> 인증
					</label>
				</div>
				<div class="form-group has feedback">
					<input type="password" name="password" class="form-control" placeholder="비밀번호">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>	
				</div>
				<div class="form-group has feedback">
					<input type="password" class="form-control" placeholder="비밀번호 확인">
					<span class="glyphicon glyphicon-log-in form-control-feedback"></span>	
				</div>
				<div class="form-group has feedback">
					<input type="text" name="name" class="form-control" placeholder="이름">
					<span class="glyphicon glyphicon-user form-control-feedback"></span>	
				</div>
				<div class="form-group has feedback">
					<input type="tel" name="phonenum" class="form-control" placeholder="전화번호">
					<span class="glyphicon glyphicon-phone form-control-feedback"></span>	
				</div>
				<div>
					<button type="submit" class="btn">가입하기</button>
				</div>
			
			
			</form>
		
		</div>
		<!-- /.login-box-body -->
	</div>
		<!-- /.login-box -->
	
	
	

</body>
</html>