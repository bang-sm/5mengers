<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>QnA 수정페이지</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	// 수정
	$(".btn_update").on("click", function(){
		if(fn_valichk()){
			return false;
		}
		formObj.attr("action", "/qna/update");
		formObj.attr("method", "post");
		formObj.submit();
		location.href("my/qnaList")
	})
	// 목록
	$(".btn_list").on("click", function(){
		
		location.href = "/my/qnaList";
	})
})
</script>
<body>
	<%@ include file="../common/head.jsp"%>
		<div id="container">
			<div id="contents">
				<form role="updateForm" method="post" action="/qna/update">
				<input type="hidden" name="qb_id" value="${update.qb_id}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="userid">작성자</label><input type="text" value="${login.userid}" id="userid" name="userid" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="qb_title">제목 :&nbsp;</label><input type="text" value="${update.qb_title}" id="qb_title" name="qb_title"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="qb_comment">문의내용</label><br>
									<textarea id="qb_comment" name="qb_comment">${update.qb_comment}</textarea>
								</td>
							</tr>
							<tr>
								<td>
									<button type="submit" class="btn_update">수정</button>
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