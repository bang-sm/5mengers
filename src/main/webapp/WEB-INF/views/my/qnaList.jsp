<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="f" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
</head>
<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<%@ include file="../common/myNav.jsp"%>

			<div class="boardList">
				<table border="1" summary="">
					<thead class="">
						<tr style="">
							<th scope="col" style="width: 70px;">NO.</th>
							<th scope="col" style="width: 84px;">작성자ID</th>
							<th scope="col" style="width: auto;">제목</th>
							<th scope="col" style="width: 45px;">구입가격</th>
							<th scope="col" style="width: 150px;" class="">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qnaList}" var="qnaList" varStatus="i">
							<tr style="color: #555555;">
<<<<<<< HEAD
								<td class="text_center">${qnaList.qb_id}</td>
								<td class="text_center">${qnaList.uuid}</td>
=======
								<td class="text_center">${i.count}</td>
								<td class="text_center">${login.userid}</td>
>>>>>>> branch 'coding_source' of https://github.com/bang-sm/5mengers
								<td class="text_center">
									<a href="/qna/readView?qb_id=${qnaList.qb_id}">${qnaList.qb_title}</a> 
								</td>
								<td class="text_center"><f:formatDate value="${qnaList.qb_date}" pattern="yyyy-MM-dd"/></td>
								<td class="text_center">?</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="box-footer">
				<div class="text-center">
					<ul id="pagination">
						<c:if test="${pageMaker.prev }">
						    <li>
						        <a href='<c:url value="/my/qnaList?page=${pageMaker.startPage-1 }"/>'>이전</i></a>
						    </li>
					    </c:if>
					    
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li>
						        <a href='<c:url value="/my/qnaList?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
						    </li>
					    </c:forEach>
					  
					    <c:if test="${pageMaker.next}">
						    <li>
						        <a href='<c:url value="/my/qnaList?page=${pageMaker.endPage+1 }"/>'>다음</a>
						    </li>
					    </c:if>
							<li>
								<button onclick="location='/qna/writeView'">작성하기</button>
							</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>