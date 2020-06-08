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
								<a href="/brb/readView?brb_id=${list.brb_id}">도서명 들어가야함</a>
							</td>
							<td>작성자(수정중)</td>
							<td><f:formatDate value="${list.brb_regdate}" pattern="yyyy-MM-dd"/></td>
							<td>${list.brb_cnt}</td>
						</tr>
						</c:forEach>
					</table>
					<div><a href="/brb/writeView">작성하기</a></div>
				</form>
			</section>
		</header>
	</div>
</body>
</html>