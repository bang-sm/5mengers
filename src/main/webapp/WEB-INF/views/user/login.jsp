<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body class="hold-transition login-page">
	<%@ include file="../common/head.jsp"%>
	<div class="site__container">
		<div class="grid__container">
			<form action="${path}/user/loginPost" method="post" class="form form--login" onsubmit="return check()">
	
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
      		<br>
      		<p class="text--center">Can't remember password? <a href="${path}/user/findingPass">Click for help</a> <span class="fontawesome-arrow-right"></span></p>
		</div>
	</div>
</body>
</html>