<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매 요청 작성페이지</title>
</head>
<body>
<div>작성자 :&nbsp;<input type="text" disabled="disabled"/></div>
<div>도서명 :&nbsp;<input type="text" disabled="disabled"/></div>
<div>가격 :&nbsp;<input type="text"/></div> <%-- 숫자만 입력 했을 때 천단위 마다 점찍기 구현해야함 --%>
<div>카테고리 :&nbsp;<select>
					<option>IT</option>
					<option>소설</option>
					<option>만화</option>
				  </select>
</div>
<br>
<div>내용<br>
<input class="context" type="text"/>
</div>
<div>게시물 등록</div><div>목록으로</div><%-- 목록으로 클릭시 confirm --%>
<hr>
<div class="search"><%-- 팝업창 --%>
	<div>도서명<input type="text"/><button>검색</button></div>
	<table>
		<tr>
			<th>번호</th>
			<th>도서명</th>
			<th>저자</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>
</body>
</html>