<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>QnA 작성페이지</title>
</head>
<script>
$(document).ready(function(){
	var formObj = $("form[name='writeForm']");
	// 등록
	$(".btn_write").on("click", function(){
		if(fn_valichk()){
			return false;
		}
		formObj.attr("action", "/qna/write");
		formObj.attr("method", "post");
		formObj.submit();
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
			<form role="writeForm" method="post" action="/qna/write">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="userid">작성자 :&nbsp;</label><input type="text" value="${login.userid}" id="userid" name="userid" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="qb_title">제목 :&nbsp;</label><input type="text" id="qb_title" name="qb_title"/>
							</td>
						</tr>	
						<tr>
							<td>
								<label for="qb_comment">문의내용</label><br>
								<textarea id="qb_comment" name="qb_comment"></textarea>
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