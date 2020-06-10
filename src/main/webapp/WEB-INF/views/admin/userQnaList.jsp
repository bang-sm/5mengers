<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.textCenter td{
	text-align: center;
}
</style>
<body>
	<%@ include file="../common/head.jsp"%>
	<%@ include file="../common/adminSideMenu.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="boardList">
				<table border="1" summary="">
					<thead class="">
						<tr style="">
							<th scope="col">NO</th>
							<th scope="col">uuid</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userqnalist}" var="userqnalist" varStatus="num">
							<tr style="color: #555555;" class="textCenter">
								<td>${num.count}</td>
								<td class="">
									<a href="${contextpath}/admin/qnalist?=${userqnalist.qb_id}">${userqnalist.userid}</a>
								</td>
								<td>${userqnalist.qb_title}</td>
								<td class="">${userqnalist.qb_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>