<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매 요청 작성페이지</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<div>작성자 :&nbsp;<input type="text" disabled="disabled"/></div>
<div>도서명 :&nbsp;<input type="text" disabled="disabled"/></div>
<div>가격 :&nbsp;<input type="text"/></div> <%-- 숫자만 입력 했을 때 천단위 마다 점찍기 구현해야함 --%>
<div>카테고리 :&nbsp;<select>
					<option>인문</option>
					<option>역사</option>
					<option>예술</option>
					<option>종교</option>
					<option>사회</option>
					<option>과학</option>
					<option>경제경영</option>
					<option>자기계발</option>
					<option>만화</option>
					<option>라이트노벨</option>
					<option>여행</option>
					<option>잡지</option>
					<option>어린이</option>
					<option>요리</option>
					<option>육아</option>
					<option>건강</option>
					<option>IT</option>
					<option>자격증</option>
					<option>참고서</option>					
				  </select>
</div>
<br>
<div>내용<br>
<textarea id="ckeditor1"></textarea>
<script>
	CKEDITOR.replace('ckeditor1', {allowedContent: true});
</script>

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