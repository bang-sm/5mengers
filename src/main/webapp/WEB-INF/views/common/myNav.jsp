<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="../resources/js/mypage.js"></script>
</head>
<body>
	<div class="title_top">
		<h2>
			MY PAGE <span class="title_sub">${login.name } 님 어세오세요!</span>
		</h2>
	</div>
	<div class="mypage_banner">
		<div>
			<a href="${contextPath}/my/boardList">구매요청 리스트</a>
		</div>
		<div>
			<a href="${contextPath}/my/qnaList">나의QnA 리스트</a>
		</div>
		<div>
			<a href="${contextPath}/my/status">나의 책 목록</a>
		</div>
		<div>
			<a href="${contextPath}/my/buycomplete">구매 히스토리</a>
		</div>
		<div>
			<a href="${contextPath}/my/myStatusUpdate">회원정보변경</a>
		</div>
	</div>
</body>
</html>