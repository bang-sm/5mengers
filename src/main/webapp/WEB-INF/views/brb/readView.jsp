<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			// 수정
			$(".btn_update").on("click", function(){
				formObj.attr("action", "/brb/updateView");
				formObj.attr("method", "get");
				formObj.submit();
			})
			// 삭제
			$(".btn_delete").on("click", function(){
				formObj.attr("action", "/brb/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			// 목록
			$(".btn_list").on("click", function(){
				location.href = "/brb/list";
			})
		});
	</script>
<body>
	<div id="root">
	<header>
		<h1>구매 요청 게시판</h1>
	</header>
	<hr>
		<section>
			<form role="form" method="post">
				<input type="hidden" id="brb_id" name="brb_id" value="${read.brb_id}">
			</form>
				<table>
					<tr>
						<td>
							<label for="brb_id">작성자(수정요)</label>
							<input type="text" id="brb_id" name="brb_id" value="${read.brb_id}" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="brb_id">도서명(수정요)</label>
							<input type="text" id="brb_id" name="brb_id" value="${read.brb_id}" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="brb_id">가격(수정요)</label>
							<input type="text" id="brb_id" name="brb_id" value="${read.brb_id}"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="brb_regdate">카테고리</label>
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
							<div id="brd_comment">${read.brd_comment}</div>
						</td>
					</tr>					
				</table>
				<button type="submit" class="btn_update">수정</button>
				<button type="submit" class="btn_delete">삭제</button>
				<button type="submit" class="btn_list">목록</button>
		</section>
	</div>
</body>
</html>