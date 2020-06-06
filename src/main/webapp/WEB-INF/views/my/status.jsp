<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<script type="text/javascript" src="../resources/js/mypage.js"></script>
<link rel="stylesheet" href="../resources/css/mypage.css">
</head>

<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="title_top">
				<h2>
					MY PAGE <span class="title_sub">${login.name } 님의  판매중인 책</span>
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
					<a href="${contextPath}/my/manyask">자주묻는질문</a>
				</div>
				<div>
					<a href="${contextPath}/my/myStatusUpdate">회원정보변경</a>
				</div>
			</div>
			<div id="myStatus">
				<div class="myStatus_box" id="sell_book"></div>
				<div class="myStatus_box" id="zzim_book"></div>
				<div class="myStatus_box" id="request_book"></div>
			</div>
			<script>
				$(document).ready(function(){
					goAjax();
					setInterval(goAjax, 30000);
				});
			</script>
		</div>
	</div>
</body>
</html>

