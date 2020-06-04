<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매 요청 작성페이지</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<section id="container">
	<form role="form" method="post" action="/brb/write">
		<table>
			<tbody>
				<tr>
					<td>
						<label for="writer">작성자(수정요)</label><input type="text" id="writer" name="writer"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="bname">도서명(수정요)</label><input type="text" id="bname" name="bname"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="price">가격(수정요)</label><input type="text" id="price" name="price"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="category">카테고리</label>
						<select>
							<option>인문</option><option>역사</option><option>예술</option><option>종교</option>
							<option>사회</option><option>과학</option><option>경제경영</option><option>자기계발</option>
							<option>만화</option><option>라이트노벨</option><option>여행</option><option>잡지</option>
							<option>어린이</option><option>요리</option><option>육아</option><option>건강</option>
							<option>IT</option><option>자격증</option><option>참고서</option>					
						</select>
				  </td>
				</tr>
				<tr>
					<td>
						<label for="brd_comment">내용</label>
						<textarea id="brd_comment"></textarea>
						<script>CKEDITOR.replace('brd_comment', {allowedContent: true});</script>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">작성</button><div>목록으로</div><%-- 목록으로 클릭시 confirm --%>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</section>
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