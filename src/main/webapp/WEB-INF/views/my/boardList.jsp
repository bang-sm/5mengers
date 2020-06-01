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
<body>
	<%@ include file="../common/head.jsp"%>

	<div id="content">
		<%@ include file="../common/sideMenu.jsp"%>
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