<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%--@ include file ="헤드 경로" --%>
<!-- <div class="login-box"> -->
<!-- 	<div class="login-box-body">
		<p class="login-box-msg"> 로그인 페이지 </p> -->
		
<%-- 		<form action="${path}/user/loginPost" method="post">
			<div class="form-group has feedback">
				<input type="text" name="userid" class="form-control" placeholder="아이디">
			</div>
			<div class="form-group has feedback">
				<input type="password" name="pass" class="form-control" placeholder="비밀번호">
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
							<a href="${path}/user/register"> 회원가입 </a>
					</div>
				</div>
			</div>
			
		</form> --%>
<body class="hold-transition login-page">
	<%@ include file="../common/head.jsp"%>
	<div class="site__container">
		<div class="grid__container">
			<form action="${path}/user/loginPost" method="post" class="form form--login">
	
		        <div class="form-group has feedback form__field">
		          <label class="fontawesome-user" for="login__username"><span class="hidden">Username</span></label>
		          <input id="login__username" name="userid" type="text" class="form__input" placeholder="Username" required>
		        </div>
		
		         <div class="form-group has feedback form__field">
		          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
		          <input id="login__password" name="pass" type="password" class="form__input" placeholder="Password" required>
		        </div>
		
		        <div class="form__field">
		          <input type="submit" value="Log In">
		        </div>
		        
       	     	<div class="checkbox icheck form__field">
       	     	 	<label class="" for="login__password">
       	     	 		<input type="checkbox" name="useCookie" class="form__input">
	     	 		</label>
	     	 		 <input type="text" readonly="readonly" class="form__input" placeholder="로그인 유지하기" required>
				</div>
	     	</form>
      		<p class="text--center">Not a member? <a href="${path}/user/register">Sign up now</a> <span class="fontawesome-arrow-right"></span></p>
		</div>
	</div>


</body>
</html>