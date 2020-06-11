<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매 요청 게시판</title>
</head>
<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
				
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>도서명</th>
							<th>구매희망가</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
							<c:forEach items="${list}" var = "list">
						<tr>
							<td>
								<c:out value="${list.brb_id}"></c:out><!-- 게시물번호 -->
							</td>
							<td>
								<c:out value="${list.brb_title}"></c:out>
							</td>
							<td>
								<a href="/brb/readView?brb_id=${list.brb_id}&uuid=${list.uuid}">${list.brb_title}</a>
							</td>
							<td>
								<c:out value="${list.brb_price}"></c:out>
							</td>
							<td>
								<c:out value="${list.name}"></c:out>
							</td>
							<td><f:formatDate value="${list.brb_regdate}" pattern="yyyy-MM-dd"/></td>
							<td>${list.brb_cnt}</td>
						</tr>
						</c:forEach>
					</table>
			</div>
		</div>
		<div class="box-footer">
				<div class="text-center">
					<ul id="pagination">
						<c:if test="${pageMaker.prev }">
						    <li>
						        <a href='<c:url value="/brb/list?page=${pageMaker.startPage-1 }"/>'>이전</a>
						    </li>
					    </c:if>
					    
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li>
						        <a href='<c:url value="/brb/list?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
						    </li>
					    </c:forEach>
					  
					    <c:if test="${pageMaker.next}">
						    <li>
						        <a href='<c:url value="/brb/list?page=${pageMaker.endPage+1 }"/>'>다음</a>
						    </li>
					    </c:if>
					</ul>
				</div>
			</div>
			<button onclick="location='/brb/writeView'">작성하기</button>
	</div>
</body>
</html>