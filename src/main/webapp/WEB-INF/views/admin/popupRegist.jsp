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
							<th scope="col" width="80%">팝업페이지</th>
							<th scope="col" width="20%">표출여부</th>
						</tr>
					</thead>
					<tbody>
						<tr style="color: #555555;" class="textCenter">
							<td class="">
								<a href="#">/home</a>
							</td>
							<td class="">
								<input type="checkbox"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<a href="${contextPath}/admin/popupWrite">새로운 팝업창 등록하기</a>
		</div>
	</div>

</body>
</html>