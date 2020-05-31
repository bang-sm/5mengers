<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매 요청 상세페이지</title>
</head>
<body>
<div>작성자 :&nbsp;<a>아무개</a></div>
<div>도서명 :&nbsp;<a>자바의 정석</a></div>
<div>가격 :&nbsp;<a>5,000</a></div>
<div>카테고리 :&nbsp;<a>IT</a></div>
<hr>
<div>내용<br>
<input class="context" type="text"/>
</div>
<div>
	<div>
		<a>아무것도 없는.</a><span>등록하기</span>
	</div>
	<div>
		<a>책이름 들어감.</a><span>삭제하기</span>
	</div>
</div>
<div><span>수정하기</span>&nbsp;<span>목록으로</span>&nbsp;<span>삭제하기</span><%-- 삭제하기 클릭시 confirm --%></div>
<hr>
<div class="bList"><%-- 팝업창 --%>
	<div>등록한 책 목록</div>
	<table>
		<tr>
			<th>번호</th>
			<th>도서명</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>
</body>
</html>