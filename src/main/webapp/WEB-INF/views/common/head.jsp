<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>Home</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="../resources/css/common.css">
</head>
<style>
#head{
	height: 50px;
	background: #e8001e;
}

#haed_nav{
	width: 1200px;
	margin: 0 auto;
	font-family: NanumBarunGothic;
	font-weight: 400;
}
#my_info{
	float: right;
}

.my_nav_left li{
	float:left;
	padding: 0 6px 0 8px;
	color: #fff;
	line-height: 50px;
}
.my_nav_right li{
	display:inline-block;
	padding: 0 6px 0 8px;
	color: #fff;
	line-height: 50px;
}
.book_serach{
	height: 30px;
}
</style>
<body>
	<div id="head">
		<div id="haed_nav"> 
			<div style="display: inline-block;">
				<a href="/">
					<img src="../resources/site_img/logo_umarket.png" height="45px"/>		
				</a>			
			</div>
			<div style="display: inline-block;">
				<ul class="my_nav_left">
					<li>
						<input type="text" name="book_serach" class="book_serach"/>
					</li>
					<li>거래요청게시판</li>
					<li>내 책 등록하기</li>
				</ul>
			</div>
			<div id="my_info" style="display: inline-block;">
				<ul class="my_nav_right">
					<li>로그인</li>
					<li>로그아웃</li>
					<li>관리자페이지</li>
					<li>
						<a href="http://localhost:8080/my/boardList">마이페이지</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>