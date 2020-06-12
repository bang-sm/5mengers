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
				<form role="fmt" method="post" action="${contextPath}/admin/popupSubmit">
					<table border="1" summary="">
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td><input type="text" name="np_title"/>${pop.np_title}</td>
							</tr>
							<tr>
								<th scope="row">팝업페이지</th>
								<td>
									<select name="np_page_name">
											<option value="/">=== 페이지선택 ===</option>
											<option value="/">메인페이지</option>
											<option value="/my/nav">마이페이지</option>
											<option value="/bookDetail">책 상세페이지</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">팝업내용</th>
								<td>
								<textarea cols="40" rows="10" style="resize: none; width: 500px; height: 300px" name="np_comment">${pop.np_comment}</textarea>
								</td>
							</tr>
							<tr>
								<td>
									<input type="submit" value="작성"/>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>

</body>
</html>