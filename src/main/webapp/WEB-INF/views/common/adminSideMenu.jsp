<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	case "/admin/qnalist":
		$(".qnalist").addClass("on");
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
			<li class="userlist"><a href="${contextPath}/admin/userlist">회원관리</a></li>
			<li class="popupregist"><a href="${contextPath}/admin/popupregist">팝업등록</a></li>
			<li class="qnalist"><a href="${contextPath}/admin/qnalist">QnA리스트</a></li>
		</ul>
	</div>
</body>
</html>