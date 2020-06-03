<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
</head>
<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="title_top">
				<h2>
					MY PAGE <span class="title_sub">내가올린 QnA</span>
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

			<div class="boardList">
				<table border="1" summary="">
					<caption>나의 QnA</caption>
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
								<a href="#">책 등록할때 사진이 안올라가요</a> 
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