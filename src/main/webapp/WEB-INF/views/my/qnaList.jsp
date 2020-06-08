<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

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
							<th scope="col" style="width: 84px;">판매자ID</th>
							<th scope="col" style="width: auto;">책제목</th>
							<th scope="col" style="width: 45px;">구입가격</th>
							<th scope="col" style="width: 150px;" class="">구매날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qnaList}" var="list" varStatus="i">
							<tr style="color: #555555;">
								<td class="text_center">${i}</td>
								<td class="text_center">${list.qb_id }</td>
								<td class="text_center">
									<a href="#">${list.qb_tilte} 정석</a> 
								</td>
								<td class="text_center">${list.qb_comment }</td>
								<td class="text_center">${list.qb_date }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


		</div>
	</div>
</body>
</html>