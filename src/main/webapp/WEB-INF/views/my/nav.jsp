<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="title_top">
				<h2>
					MY PAGE <span class="title_sub"> 회원님의 개인페이지입니다.</span>
				</h2>
			</div>
			<div class="mypage_banner">
				<div>
					<a href="http://localhost:8080/my/boardList">구매요청 리스트</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/qnaList">나의QnA 리스트</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/sellbook">판매중인책</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/buybook">구매중인책</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/zzim">찜목록</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/buycomplete">구매내역리스트</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/manyask">자주묻는질문</a>
				</div>
			</div>
			<!-- .mypage_banner -->
			<div class="xans-element- xans-myshop xans-myshop-bankbook">
				<ul>
					<li class="first">
						<strong class="title">판매중인 책</strong> 
						<strong class="data use">
							<c:out value="${sellingbook}"/>개
						</strong> 
						<a href="#">조회</a>
					</li>
					<li class="">
						<strong class="title">구매중인 책</strong>
					 	<strong class="data">
					 		<c:out value="${buyingbook}"/>개
					 	</strong>
					 	<a href="#">조회</a>
				 	</li>
					<li class="">
						<strong class="title">찜 중인 책</strong>
					 	<strong class="data">
					 		<c:out value="${zzim}"/>개
					 	</strong>
					 	<a href="#">조회</a>
				 	</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>