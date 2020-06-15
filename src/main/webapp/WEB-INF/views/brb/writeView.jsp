<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/booksellregistPage.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/js/booksearch.js"></script>
<title>구매 요청 작성페이지</title>
</head>
<script>
	$(document).ready(function(){
		var formObj = $("form[name='writeForm']");
		// 등록
		$(".btn_write").on("click", function(){
			if(fn_valichk()){
				return false;
			}
			formObj.attr("action", "/brb/write");
			formObj.attr("method", "post");
			formObj.submit();
		})
		// 목록
		$(".btn_list").on("click", function(){
			
			location.href = "/brb/list";
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
	
	 $(document).on('click', '.searchTitle', function() {
      var name = $(this).text();
      $("#brb_bookname").text(name);
      $("#brb_bookname").val(name);
      $("#bookajax").children().remove();
      $("#booklist").hide();
   });
</script>
<body>
	<div id="booklist">
		<div id="booklist_div">

			<table id="bookajax"></table>

		</div>
	</div>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<form name="writeForm" role="form" method="post" action="/brb/write">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${login.userid}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="brb_isbn">책등록</label><input type="text" id="brb_search" class="book" name="brb_search" />
								<button type="button" class="bookbtn" onclick="booksearch()">책검색</button>
							</td>
						</tr>
						<tr>
							<td>
								<label for="brb_bookname">책 이름</label><input type="text" id="brb_bookname" name="brb_bookname" class="chk" value="" readonly/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="brb_title">게시물 제목</label><input type="text" id="brb_title" name="brb_title" class="chk" value="제목을 입력하세요"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="brb_price">구매 희망가</label><input type="text" id="brb_price" name="brb_price" class="chk"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="bk_category">카테고리</label> <!-- null check?? -->
								<select id="bk_category" name="bk_category">
		                           <option value="1">인문</option>
		                           <option value="2">역사</option>
		                           <option value="3">예술</option>
		                           <option value="4">종교</option>
		                           <option value="5">사회</option>
		                           <option value="6">과학</option>
		                           <option value="7">경제경영</option>
		                           <option value="8">자기계발</option>
		                           <option value="9">만화</option>
		                           <option value="10">라이트노벨</option>
		                           <option value="11">여행</option>
		                           <option value="12">잡지</option>
		                           <option value="13">어린이</option>
		                           <option value="14">요리</option>
		                           <option value="15">육아</option>
		                           <option value="16">건강</option>
		                           <option value="17">IT</option>
		                           <option value="18">자격증</option>
		                           <option value="19">참고서</option>
								</select>
						  </td>
						</tr>
						<tr>
							<td>
								<label for="brd_comment">내용</label><br>
								<textarea id="brd_comment" name="brd_comment"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<button type="submit" class="btn_write">등록</button>
								<button type="button" class="btn_list">목록</button><%-- 목록으로 클릭시 confirm --%>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	
</body>
</html>