<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
 <%@ include file="../common/head.jsp"%>
 <script type="text/javascript">
	
	$(function(){
		
		$("#kakao_confirm").hide();
		
		$("#id_confirm_btn").on("click", function(){
			
			var userid = $("#id_confirm").val();
			
			$.ajax({
				url : "/user/findingPass",
				type : "POST",
				dataType : "json",
				data: {"userid" : userid},
				success : function(data){
					
					if(data == 1){
						$("#id_confirm_cb").attr("checked", "checked");
						$("#id_confirm").attr("readonly", "readonly");
						$("#kakao_confirm").show();
					} else {
						alert("아이디를 다시 확인해 주세요");
						$("#id_confirm").val("").focus();
					} 
					
				} , error : function() {
					alert("실패");
				}
				
			}) // end ajax
			
		}); // end click event
		
	}); // end ready

	function checks() {
		
		if($("id_confirm_cb").val() != "true"){
			return false;
		}
		return true;
		
	} // end checks()
	

</script> 
<body>
 
 

<form action="${path }/user/findingPass" method="post" onsubmit="return checks()">
	<div><h2>비밀번호 변경</h2></div>
	
	
	
	<input type="text" id="id_confirm" placeholder="아이디"/>
	<input type="checkbox" id="id_confirm_cb" value="true" onclick="return false"> 
	<br><br>
	
	<button id="id_confirm_btn" type="submit">비밀번호 찾기</button>
	
</form>

	<div id="kakao_confirm">
		<div><h2> SNS 인증</h2></div>
		<button><a href="https://kauth.kakao.com/oauth/authorize?client_id=fb1d8350db62c7161d16a4c91065256f&redirect_uri=http://localhost:8080/user/findingPassAuth&response_type=code">카카오 본인 인증</a></button>
		
	</div>
	
	

</body>
</html>