<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="../resources/js/mypage.js"></script>
</head>
<script>
	$(document).ready(function(){
		
		var link = document.location.pathname;
		switch (link) {
		case "/my/boardList":
			$(".boardList").addClass("on");
			break;
		case "/my/qnaList":
			$(".qnaList").addClass("on");
			break;
		case "/my/status":
			$(".status").addClass("on");
			break;
		case "/my/buycomplete":
			$(".buycomplete").addClass("on");
			break;
		case "/my/myStatusUpdate":
			$(".myStatusUpdate").addClass("on");
			break;
		default:
			break;
		}
	});
</script>
<body>
	<div class="title_top">
		<h2>
			MY PAGE <span class="title_sub">${login.name } 님 어세오세요!</span>
		</h2>
	</div>
	<div class="mypage_banner">
		<div>
			<a href="${contextPath}/my/boardList" class="boardList">구매요청 리스트</a>
		</div>
		<div>
			<a href="${contextPath}/my/qnaList" class="qnaList">나의QnA 리스트</a>
		</div>
		<div>
			<a href="${contextPath}/my/status" class="status">나의 책 목록</a>
		</div>
		<div>
			<a href="${contextPath}/my/buycomplete" class="buycomplete">구매 히스토리</a>
		</div>
		<div>
			<a href="${contextPath}/my/myStatusUpdate" class="myStatusUpdate">회원정보변경</a>
		</div>
	</div>
</body>
</html>