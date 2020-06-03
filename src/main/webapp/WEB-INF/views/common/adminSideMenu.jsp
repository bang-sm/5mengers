<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<script>
$(document).ready(function(){
	
	var link = document.location.pathname;
	
	switch (link) {
	case "/admin/userlist":
		$(".userlist").addClass("on");
		break;
	case "/admin/popupregist":
		$(".popupregist").addClass("on");
		break;
	case "/admin/popupupdate":
		$(".popupupdate").addClass("on");
		break;
	case "/admin/popuplist":
		$(".popuplist").addClass("on");
		break;
	default:
		break;
	}
});

</script>
</head>
<body>
	<div class="menu_left">
		<ul>
			<li class="userlist"><a href="http://localhost:8080/admin/userlist">회원관리</a></li>
			<li class="popupregist"><a href="http://localhost:8080/admin/popupregist">팝업등록</a></li>
			<li class="popupupdate"><a href="http://localhost:8080/admin/popupupdate">팝업수정</a></li>
			<li class="popuplist"><a href="http://localhost:8080/admin/popuplist">팝업리스트관리</a></li>
		</ul>
	</div>
</body>
</html>