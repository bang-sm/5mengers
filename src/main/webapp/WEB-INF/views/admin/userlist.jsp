<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/head.jsp"%>
	<div id="content">
		<%@ include file="../common/adminSideMenu.jsp"%>
		
		<div id="request_box">
			<table class="table table-hover table_css">
				<caption>회원리스트</caption>
				<colgroup>
					<col />
					<col />
					<col />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>회원이름</th>
						<th>아이디</th>
						<th>판매개수</th>
						<th>구매개수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>자바의</td>
						<td>2020-05-20</td>
						<td>N</td>
						<td>2020-05-20</td>
					</tr>
					<tr>
						<td>2</td>
						<td>자바</td>
						<td>2020-05-20</td>
						<td>Y</td>
						<td>2020-05-20</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>