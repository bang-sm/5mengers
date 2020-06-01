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
	case "/my/boardList":
		$(".requestboard").addClass("on");
		break;
	case "/my/qnaList":
		$(".qnaboard").addClass("on");
		break;
	case "/my/bookStatus":
		$(".bookstatus").addClass("on");
		break;
	case "/my/userinfochange":
		$(".userinfochange").addClass("on");
		break;
	case "/my/buylist":
		$(".buylist").addClass("on");
		break;
	case "/my/manyask":
		$(".manyask").addClass("on");
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
			<li class="requestboard"><a href="http://localhost:8080/my/boardList">거래요청게시판</a></li>
			<li class="qnaboard"><a href="http://localhost:8080/my/qnaList">QnA게시판</a></li>
			<li class="bookstatus"><a href="http://localhost:8080/my/bookStatus">책관리게시판</a></li>
			<li class="userinfochange"><a href="http://localhost:8080/my/userInfo">회원정보변경</a></li>
			<li class="buylist"><a href="http://localhost:8080/my/completBook">구매내역리스트</a></li>
			<li class="manyask"><a href="http://localhost:8080/my/userAsk">자주묻는질문</a></li>
		</ul>
	</div>
</body>
</html>