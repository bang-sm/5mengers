<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>구매 요청 작성페이지</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 목록
		$(".btn_list").on("click", function(){
			
			location.href = "/brb/list";
		})
	})
</script>
<body>
<section id="container">
	<form role="updateForm" method="post" action="/brb/update">
	<input type="hidden" name="brb_id" value="${update.brb_id}" readonly="readonly"/>
		<table>
			<tbody>
				<tr>
					<td>
						<label for="userid">작성자</label><input type="text" id="userid" name="userid" value="${login.userid}" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="brb_isbn">도서명</label><input type="text" id="brb_isbn" name="brb_isbn" readonly="readonly"/><button type="button">도서검색</button>
					</td>
				</tr>
				<tr>
					<td>
						<label for="brb_title">게시물 제목</label><input type="text" id="brb_title" name="brb_title" class="chk" value="${update.brb_title}"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="brb_price">구매 희망가</label><input type="text" id="brb_price" name="brb_price" class="chk" value="${update.brb_price}"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="bk_category">카테고리</label> <!-- null check?? -->
						<select id="bk_category" name="bk_category">
							<option value="01">인문</option><option value="02">역사</option><option value="03">예술</option>
							<option value="04">종교</option><option value="05">사회</option><option value="06">과학</option>
							<option value="07">경제경영</option><option value="08">자기계발</option><option value="09">만화</option>
							<option value="10">라이트노벨</option><option value="11">여행</option><option value="12">잡지</option>
							<option value="13">어린이</option><option value="14">요리</option><option value="15">육아</option>
							<option value="16">건강</option><option value="17">IT</option><option value="18">자격증</option>
							<option value="19">참고서</option>					
						</select>
				  </td>
				</tr>
				<tr>
					<td>
						<label for="brd_comment">내용</label><br>
						<textarea id="brd_comment" name="brd_comment">${update.brd_comment}</textarea>
						
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">수정</button><button type="button" class="btn_list">목록</button><%-- 목록으로 클릭시 confirm --%>
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