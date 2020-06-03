<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매 요청 게시판</title>
</head>
<script src="/resources/js/bookrequest.js" type="text/javascript">
</script>
<body>
<div class="toptitle">구매요청 TOP 3
	<table>
		<tr>
			<th>순위</th>
			<th>도서명</th>		
			<th>저자</th>		
			<th>정가</th>		
		</tr>
		<tr>
			<td class="rank">1</td>
			<td class="bname">자바의 정석</td>
			<td class="writer">남궁성</td>
			<td class="bfixedprice">25,000</td>
		</tr>
		<tr>
			<td class="rank">2</td>
			<td class="bname">자바의 정석</td>
			<td class="writer">남궁성</td>
			<td class="bfixedprice">25,000</td>
		</tr>
		<tr>
			<td class="rank">3</td>
			<td class="bname">자바의 정석</td>
			<td class="writer">남궁성</td>
			<td class="bfixedprice">25,000</td>
		</tr>
	</table>
</div>
<div>구매요청 리스트
<table>
	<tr>
		<th>번호</th>
		<th>도서명</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<tr>
		<td>brb_id</td>
		<td>bookname</td>
		<td>uuid.name</td>
		<td>brb_regdate</td>
		<td>brb_cnt</td>
	</tr>
</table>	
</div>
<div>페이징</div>
<div>도서명 검색<input type="text"/></div>


</body>
</html>