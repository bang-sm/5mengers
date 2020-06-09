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
<script type="text/javascript">
</script>
<body>
	<header>
		<h1>QnA 작성페이지</h1>
	</header>
	<section id="container">
		<form role="form" method="post" action="/qna/write">
			<div><label for="userid">작성자 :&nbsp;</label><input type="text" value="${login.userid}" id="userid" name="userid" readonly="readonly"/></div>
			<div><label for="qb_title">제목 :&nbsp;</label><input type="text" id="qb_title" name="qb_title"/></div>
			<div>문의내용<br>
			<textarea id="qb_comment" name="qb_comment"></textarea>
			</div>
			<button type="submit">QnA 등록</button>
		</form>
			<div><a href="/my/qnaList">목록으로</a></div><%-- 목록으로 클릭시 confirm --%>
	</section>
</body>
</html>