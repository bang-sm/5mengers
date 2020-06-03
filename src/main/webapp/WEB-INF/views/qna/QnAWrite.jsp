<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QnA 작성페이지</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<div>작성자 :&nbsp;<input type="text" disabled="disabled"/></div>
<div>제목 :&nbsp;<input type="text"/></div>

<br>
<div>문의내용<br>
<textarea id="ckeditor1"></textarea>
<script>
	CKEDITOR.replace('ckeditor1', {allowedContent: true});
</script>
</div>
<div>QnA 등록</div><div>목록으로</div><%-- 목록으로 클릭시 confirm --%>
</body>
</html>