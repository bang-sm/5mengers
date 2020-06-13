<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="../common/head.jsp"%>
<link rel="stylesheet" href="../resources/css/register.css">
<link rel="stylesheet" href="../resources/css/modal.css">

<script type="text/javascript">

$(document).ready(function(){

 // modal 
    var modal = $("#dropModal");
    var btn = $("#dropBtn");
    var close = $(".close");

    btn.on("click", function(){
        modal.css("display", "block");
    });

    close.on("click", function(){
        modal.css("display", "none");
    });

    window.onclick = function(event) {
        if(event.target == modal){
            modal.css("display", "none");
        }
    }
    
});

function check(){

    if($("#pw_input").val() == ""){
    	alert("비밀번호를 입력해 주세요!")
    	return false;
    }
    
    var result = confirm("회원 탈퇴를 진행 하시겠습니까?");
    
    if(result){ // yes!
	    alert("회원탈퇴 완료");
	    return true;
	    
    } else { // no!
    	location.replace("../my/userInfo")
    	return false;
    }
}

</script>

<body>
<div class="site__container">
<%@ include file="../user/updatePass.jsp" %>

<!-- 회원탈퇴 modal open!-->
<%-- <button id="dropBtn"> 회원 탈퇴 </button>
--%>
<!-- 모달!! -->
<div id="dropModal" class="modal">

    <!-- modal contents -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">&times;</span>
            <h2> 회원 탈퇴</h2>
            <hr><br>
            <span class="warning"> * 탈퇴하시면 다시 계정을 사용하실수 없습니다.</span>

        </div>
        <div id="modelinnercontent">
            <form id="modal-form" action="/my/userInfo" method="POST" onsubmit="return check()">
                <br>
                <div class="userid_check">
                    <span id="userid_display"> &nbsp&nbsp탈퇴할 회원의 아이디 : </span>
                    <input id="user_id_confrim" value="${login.userid}" name="userid" readonly="readonly"><br>
                    <%-- <input type="text" id="uuid" name="uuid" value="${login.uuid}" hidden="hidden"><br> --%> 
                    <br><div class="warningDiv"><span class="warning"> * 탈퇴할 아이디를 확인해 주세요. </span></div>
                </div>
				<br>
                <div class="pw">
                    &nbsp<input type="password" id="pw_input" name="pass" placeholder="비밀번호 입력">
                    
                </div>
				<br>
                <div class="submitBtn">
                    <button type="submit" id="ModaldropBtn">탈퇴하기</button>
                </div>
            </form>
        </div>
       
    </div>


</div>

</div>
</body>
</html>