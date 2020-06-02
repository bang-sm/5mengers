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

		<section id="container">
			<form role="form" method="post" action="/booksellregist/booksellregistPage">
				<table>
					<tbody>
						<tr>
							<td><label for="title">책 이름</label>
							<input type="text" id="title" name="bsr_price" /></td>
						</tr>
						<tr>
							<td><label for="content">소개글</label>
							<textarea id="content" name="bsr_comment"></textarea></td>
						</tr>
						<tr>
							<td><label for="price">정가</label>
							<input type="text" id="writer" name="bsr_price" /></td>
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