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
							<th scope="col">NO.</th>
							<th scope="col">아이디</th>
							<th scope="col">회원이름</th>
							<th scope="col">판매개수</th>
							<th scope="col" class="">구매개수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userbuysell}" var="userbuysell" varStatus="num">
							<tr style="color: #555555;" class="textCenter">
								<td><c:out value="${num.count}"/></td>
								<td class=""><c:out value="${userbuysell.userid}"/></td>
								<td><c:out value="${userbuysell.name}"/></td>
								<td class=""><c:out value="${userbuysell.sell_count}"/></td>
								<td class=""><c:out value="${userbuysell.buy_count}"/></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>