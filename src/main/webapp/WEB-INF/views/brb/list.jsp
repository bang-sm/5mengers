<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매 요청 게시판</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
			<section id="container">
				<form role="form" method="post" action="/bookRequest/BookRequestWrite">
					<table>
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
						
						<c:forEach items="${list}" var = "list">
						<tr>
							<td><c:out value="${list.brb_id}"></c:out></td>
							<td>
								<a href="/brb/readView?brb_id=${list.brb_id}">제목(수정중)</a>
							</td>
							<td>작성자(수정중)</td>
							<td><f:formatDate value="${list.brb_regdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
						</c:forEach>
					</table>
				</form>
			</section>
		</header>
	</div>
</body>
</html>