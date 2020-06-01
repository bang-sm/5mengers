<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
</head>
<style>

</style>
<body>
	<%@ include file="../common/head.jsp"%>

	<div id="content">
		<%@ include file="../common/sideMenu.jsp"%>	
		<div id="request_box">
			<table class="table table-hover table_css">
				<caption>QnA 게시판</caption>
				<colgroup>
					<col />
					<col />
					<col />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>책 제목</th>
						<th>등록 날짜</th>
						<th>댓글여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>자바의 정석</td>
						<td>2020-05-20</td>
						<td>N</td>
					</tr>
					<tr>
						<td>2</td>
						<td>씨언어의 정석</td>
						<td>2020-05-20</td>
						<td>Y</td>
					</tr>
					<tr>
						<td>3</td>
						<td>긴 제목의 책~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
						<td>2020-05-20</td>
						<td>Y</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>