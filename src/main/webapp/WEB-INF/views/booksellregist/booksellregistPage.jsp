<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>게시판</title>
</head>
<body>

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />

		<section id="container">					<!-- Controller의 value값과 동일하게 해줄것 -->
			<form role="form" method="post" action="/booksellregistPage" enctype="multipart/form-data">
				<table>
					<tbody>
						<tr>
							<td><label for="title">책 이름</label>
							<input type="text" id="title" name="bsr_name" /></td>
						</tr>
						<tr>
							<td><label for="content">소개글</label>
							<textarea id="content" name="bsr_comment"></textarea></td>
						</tr>
						<tr>
							<td><label for="fix_price">정가</label>
							<input type="text" id="writer" name="bsr_fixed_price" /></td>
						</tr>
						<tr>
							<td><label for="price">희망 판매가</label>
							<input type="text" id="writer" name="bsr_price" /></td>
						</tr>
						<tr>
							<td><label for="bsr_id">유저 고유값</label>
							<input type="text" id="writer" name="bsr_id" /></td>
						</tr>
						<tr>
							<td><label for="bsr_regdate">현재시간</label>
							<input type="text" id="writer" name="bsr_regdate" /></td>
						</tr>
						<tr>
							<td><label for="bsr_category">카테고리</label> <!-- select 형태로 바꿀것 -->
							<input type="text" id="writer" name="bsr_category" /></td>
						</tr>
						<tr>
							<td>
								<input type="file" name"file">									
							</td>
						</tr>
						
						
						
						<tr>
							<td>
								<button type="submit">작성</button>
							</td>
						</tr>
						
						
					</tbody>
				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>