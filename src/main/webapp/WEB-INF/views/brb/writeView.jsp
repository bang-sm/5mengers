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
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<script>
	$(document).ready(function(){
		var formObj = $("form[name='writeForm']");
		$(".btn_write").on("click", function(){
			if(fn_valichk()){
				return false;
			}
			formObj.attr("action", "/brb/write");
			formObj.attr("method", "post");
			formObj.submit();
		})
		function fn_valichk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i < regForm; i++) {
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert("가격을 입력해주세요");
					return true;
				}
			}
		}
	})
</script>
<body>
<section id="container">
	<form name="writeForm" role="form" method="post" action="/brb/write">
		<table>
			<tbody>
				<tr>
					<td>
						<label for="writer">작성자(수정요)</label><input type="text" id="writer" name="writer" value="${login.userid}" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="bname">도서명(수정요)</label><input type="text" id="bname" name="bname"/><div><a href="#">도서검색</a></div>
					</td>
				</tr>
				<tr>
					<td>
						<label for="price">가격(수정요)</label><input type="text" id="price" name="price" class="chk"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="category">카테고리</label> <!-- null check?? -->
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
						<label for="brd_comment">내용</label>
						<textarea id="brd_comment" name="brd_comment"></textarea>
						<script>CKEDITOR.replace('brd_comment', {allowedContent: true});</script>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn_write">등록</button><button>목록</button><%-- 목록으로 클릭시 confirm --%>
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