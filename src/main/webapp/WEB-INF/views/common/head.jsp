<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>Home</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/mypage.css">
</head>
<body>
	<div id="head">
		<div id="top_main">
			<div style="font-size: 70px;font-weight: 700">
				<img src="https://cphoto.asiae.co.kr/listimglink/6/2020042808572299616_1588031843.jpg" height="150px">
			</div>
			<ul id="top_nav">
				<li>관리자페이지</li>
				<li>로그아웃</li>
				<li>로그인</li>
			</ul>

		</div>
		<div style="clear: both"></div>
		<div id="haed_nav">
		<!--<input type="text" name="book_serach" class="book_serach" style="color: #000"/> -->
			<div style="display: inline-block;">
				<ul class="my_nav_left">
					<li>5mengers</li>
					<li>거래요청게시판</li>
					<li>내 책 등록하기</li>
				</ul>
			</div>
			<div id="my_info" style="display: inline-block;">
				<ul class="my_nav_right">
					<li class="dropdown_li">
						<a href="http://localhost:8080/my/boardList">마이페이지</a>
						<dl class="dropdown_menu">
							<dd><a href="#">거래요청게시판</a></dd>
							<dd><a href="#">QnA게시판</a></dd>
							<dd><a href="#">책관리게시판</a></dd>
							<dd><a href="#">회원정보변경</a></dd>
							<dd><a href="#">구매내역리스트</a></dd>
							<dd><a href="#">자주묻는질문</a></dd>
					    </dl>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>