<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<link rel="stylesheet" href="../resources/css/mypage.css">
</head>
<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<%@ include file="../common/myNav.jsp"%>

			<div class="boardList">
				<table border="1" summary="">
					<caption>구매요청 리스트</caption>
					<thead class="">
						<tr style="">
							<th scope="col" style="width: 70px;">NO.</th>
							<th scope="col" style="width: auto;">게시글제목</th>
							<th scope="col" style="width: 84px;">원하는책</th>
							<th scope="col" style="width: 80px;" class="">등록날짜</th>
							<th scope="col" style="width: 55px;" class="">댓글유무</th>
						</tr>
					</thead>
					<tbody>
						<tr style="color: #555555;" >
							<td>5</td>
							<td class="subject">
								<a href="#">자바의 정석책 구해요~~</a> 
							</td>
							<td>원디자인</td>
							<td class="txtLess ">2017-12-10</td>
							<td class="txtLess ">Y</td>
						</tr>
					</tbody>
				</table>
			</div>


		</div>
	</div>
</body>
</html>