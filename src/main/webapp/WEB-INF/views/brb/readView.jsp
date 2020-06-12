<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>구매 요청 상세페이지</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");
		// 수정
		$(".btn_update").on("click", function() {
			formObj.attr("action", "/brb/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		})
		// 삭제
		$(".btn_delete").on("click", function() {
			formObj.attr("action", "/brb/delete");
			formObj.attr("method", "post");
			formObj.submit();
		})
		// 목록
		$(".btn_list").on("click", function() {

			location.href = "/brb/list";
		})
		// 댓글 등록
		var formObj = $("form[name='replyForm']");
		$(".btn_replyWrite").on("click", function(){
			formObj = $("form[name='replyForm']");
			formObj.attr("action", "/brb/replyWrite");
			formObj.attr("method", "post");
			formObj.submit();
		})
		// 댓글 삭제 ///brb/replyDelete
		$(".btn_replyDelete").on("click", function() {
			var brbr_id=$(this).val();
			location.href="${contextpath}/brb/replyDelete?brbr_id="+brbr_id+"";
		});
		///////////////////////////////////////////
		////////댓글 클릭시 나의 등록된 책 등록///////////////
		$(".uuid_book_search").click(function(){
			$.ajax({
				url : "/brb/mybooklist", // controller에서 받는다
				type : "GET",
				data:{
					"uuid" : ${user}
				},
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						var book='<tr>'+
							'<td class="bsrid">'+data[i].bsr_id+'</td>'+
							'<td class="bsr_name">'+data[i].bsr_name+'</td>'+
							'<td class="bsr_price">'+data[i].bsr_price+'</td>'+
							'</tr>';
						$("#my_buying_book_list").append(book);
					}
				},
				error : function() {

				}
			});
		});
	})


</script>
<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<hr>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="brb_id" name="brb_id"
					value="${read.brb_id}">
			</form>
			<table>
				<tr>
					<td><label for="brb_id">작성자</label> 
						<input type="text" id="userid" name="userid" value="${read.name}" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td><label for="brb_id">도서명(수정요)</label> <input type="text"
						id="brb_id" name="brb_id" value="${read.brb_bookname}"
						disabled="disabled" /></td>
				</tr>
				<tr>
					<td><label for="brb_title">게시물 제목</label> <input type="text"
						id="brb_title" name="brb_title" value="${read.brb_title}"
						disabled="disabled" /></td>
				</tr>
				<tr>
					<td><label for="brb_price">구매희망가</label> <input type="text"
						id="brb_price" name="brb_price" value="${read.brb_price}"
						disabled="disabled" /></td>
				</tr>
				<tr>
					<td><label for="brb_regdate">카테고리</label> <input type="text"
						id="bk_category" name="bk_category" value="${read.bc_name}"
						disabled="disabled" /></td>
				</tr>
				<tr>
					<td><label for="brd_comment">내용</label>
						<div>${read.brd_comment}</div></td>
				</tr>
			</table>
			<div>
				<button type="submit" class="btn_update">수정</button>
				<button class="btn_delete">삭제</button>
				<button type="button" class="btn_list">목록</button>
			</div>
			<form name="replyForm" role="form" method="post">
				<input type="hidden" id="brb_id" name="brb_id"
					value="${read.brb_id}">
				<div>
					<button type="button" class="uuid_book_search">나의 책 등록 하기</button>
					<input type="text" id="uuid_book_url" name="uuid_book_url"/>
					<button type="button" class="btn_replyWrite">등록</button>
				</div>
			</form>
		</div>
		<div id="replyRead">
			<table>
				<c:forEach items="${replyRead}" var="replyRead">
					<tr>
						<td>
							<div>${replyRead.uuid_book_url }
								<button type="button" class="btn_replyDelete" value="${replyRead.brbr_id}">삭제</button>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div style="width:500px;height: 700px;border: 1px solid #000" id="mybookpopupBox">
			<table id="my_buying_book_list">
				
			</table>
		</div>
	</div>
</body>
<script>
$(document).on('click', '.bsr_name', function() {
	console.log("클릭되는중");
	console.log($(this).text());
	var name = $(this).text();
    $("#uuid_book_url").val(name);
    $("#bookajax").children().remove();
    $("#booklist").hide();
});
</script>
</html>