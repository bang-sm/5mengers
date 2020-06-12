<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
 <%@ include file="../common/head.jsp"%>
 <script type="text/javascript">
 
	$(function(){
		
		$("#id_confirm_btn").on("click", function(){
			
			var userid = $("#id_confirm").val();
			
			$.ajax({
				url : "/user/findingPass",
				type : "POST",
				dataType : "json",
				data: {
					"userid" : userid
				},
				success : function(data){
					
/* 					if(data == 1){
						alert("")
						
					} else {
						alert("아이디를 다시 확인해 주세요");
						$("#id_confirm").val("").focus();
					}  */
					
				} , error : function() {
					alert("회원가입시 등록된 이메일로 임시 비밀번호를 발급하였습니다.");
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
	
	<div><span>계정의 아이디를 입력해 주세요</span></div>
	<input type="text" id="id_confirm" name="userid" placeholder="아이디"/>
	<br><br>
	
	<button id="id_confirm_btn" type="submit">비밀번호 찾기</button>
	
</form>
</body>
</html>