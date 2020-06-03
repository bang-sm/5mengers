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
.textCenter td {
	text-align: center;
}
</style>
<body>
	<%@ include file="../common/head.jsp"%>
	<%@ include file="../common/adminSideMenu.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="boardView ">
				<table border="1" summary="">
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td>문의사항 입니다.</td>
						</tr>
						<tr>
							<th scope="row">팝업페이지</th>
							<td>원디자인 <span class="displaynone">(ip:)</span>
							</td>
						</tr>
						<tr>
							<th scope="row">팝업내용</th>
							<td>원디자인 <span class="displaynone">(ip:)</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>