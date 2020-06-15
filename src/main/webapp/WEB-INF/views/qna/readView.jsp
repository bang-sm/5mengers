<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>QnA 상세페이지</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		// 수정
		$(".btn_update").on("click", function(){
			formObj.attr("action", "/qna/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		});
		// 삭제
		$(".btn_delete").on("click", function(){
			formObj.attr("action", "/qna/delete");
			formObj.attr("method", "post");
			formObj.submit();
		});
		// 목록
		$(".btn_list").on("click", function(){
			location.href = "/my/qnaList";
		});
		$(".btn_replyWrite").on("click", function(){
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/qna/replyWrite");
			formObj.submit();
		});
	})
</script>
<body>
<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="qb_id" name="qb_id" value="${read.qb_id}">
			</form>
			<table>
				<tr>
					<td>
						<label for="qb_id">작성자</label>
						<input type="text" value="${login.userid}" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="qb_title">제목</label>
						<input type="text" id="qb_title" name="qb_title" value="${read.qb_title}" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="qb_comment">내용</label>							
						<div>${read.qb_comment}</div>
					</td>
				</tr>					
			</table>
			<div>
				<button type="submit" class="btn_update">수정</button>
				<button type="submit" class="btn_delete">삭제</button>
				<button type="submit" class="btn_list">목록</button>
			</div>
			<div id="reply">
				<ol class="replyList">
					<c:forEach items="${replyList}" var="replyList">
						<li>
							${replyList.qbr_comment}
						</li>
					</c:forEach>
				</ol>				
			</div>
			<form name="replyForm" role="form" method="post">
				<input type="hidden" id="qb_id" name="qb_id" value="${read.qb_id}">
				<div>
					<label for="qbr_comment">답변</label><input type="text" id="qbr_comment" name="qbr_comment"/>
				</div>
				<div>
					<button type="button" class="btn_replyWrite">등록</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>