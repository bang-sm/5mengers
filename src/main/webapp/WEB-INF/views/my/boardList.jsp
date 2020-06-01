<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
.menu_left {
	float: left;
	width: 200px;
	position: absolute;
	left: 0;
	top: 50px;
	bottom: 0;
	border-right: 2px solid #e5e5e5;
}

.menu_left ul li {
	padding: 10px;
}

.menu_left ul li a {
	font-family: NanumBarunGothic;
	font-weight: 700px;
	color: #000;
	text-decoration: none;
}
#request_box{
	position: absolute;
	left:250px;
	top:100px;
}
.table_css{
	width:800px;
	border: 1px solid #e5e5e5;
	max-width: 800px;
}
</style>
<body>
	<%@ include file="../common/head.jsp"%>

	<div id="content">
		<div class="menu_left">
			<ul>
				<li><a href="http://localhost:8080/my/boardList">거래요청게시판</a></li>
				<li class=""><a href="http://localhost:8080/my/qnaList">QnA게시판</a></li>
				<li class=""><a href="http://localhost:8080/my/bookStatus">책관리게시판</a></li>
				<li class=""><a href="http://localhost:8080/my/userInfo">회원정보변경</a></li>
				<li class=""><a href="http://localhost:8080/my/completBook">구매내역리스트</a></li>
				<li class=""><a href="http://localhost:8080/my/userAsk">자주묻는질문</a></li>
			</ul>
		</div>
		<div id="request_box">
			<table class="table table-hover table_css">
				<caption>거래요청게시판</caption>
				<colgroup>
					<col />
					<col />
					<col />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th width="70%">책 제목</th>
						<th>등록 날짜</th>
						<th>댓글여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>자바의</td>
						<td>2020-05-20</td>
						<td>N</td>
					</tr>
					<tr>
						<td>2</td>
						<td>자바</td>
						<td>2020-05-20</td>
						<td>Y</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>