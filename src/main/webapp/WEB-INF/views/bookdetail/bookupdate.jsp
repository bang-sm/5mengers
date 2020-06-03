<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
</head>
<body>
<%@ include file="../common/head.jsp"%>


<div>
	<div>글 수정</div>
	<form action="">
	<div>책 이름 </div>
	<div>${bookupdate[0].bsr_name}</div>
	<div>카테고리</div>
	<div>${bookupdate[0].bsr_category}</div>
	<div>정가</div>
	<div>${bookupdate[0].bsr_fixed_price}</div>
	<div>판매가</div>
	<input type="text" name="bsr_price" value="${bookupdate[0].bsr_price }"/>
	<div>책 소개글</div>
	<textarea>${bookupdate[0].bsr_comment }</textarea>
	
	</form>
</div>
</body>
</html>