<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>


</head>
<%@ include file="../common/head.jsp"%>

<!-- jquery 사용을 위한 src -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- none -> block -->
<script type="text/javascript">
	$(document).on('click', '.searchTitle', function() {
		var name = $(this).text();
		var author = $(this).siblings(".author").text();
		var price = $(this).siblings(".price").text();
		$("#booktitle").text(name);
		$("#booktitle").val(name);
		$("#fixedprice").text(price);
		$("#fixedprice").val(price);
		$("#author").text(author);
		$("#author").val(author)
		$("#bookajax").children().remove();
	});

</script>

<!-- 책 API list style -->
<style>
#bookajax .booktr:hover {
	background-color: #CEE3F6;
}
</style>
<body>
	<h1>책 등록</h1>
	<hr />
	<input class="book" type="text" name="title" value="책 이름 " />
	<button class="bookbtn" onclick="booksearch()">책 검색</button>
	<div id="booklist">
		<div id="booklist_div">

			<table id="bookajax"></table>

		</div>
	</div>

	<div id="root">

		
		<div id="container">
			<!-- Controller의 value값과 동일하게 해줄것 -->
			<form name="form" method="post" action="/booksellregistPage"
				enctype="multipart/form-data">
				<!-- action 변경할 것 -->
				<table>
					<tbody>
						<tr>
							<td><label for="title">책 이름 :</label> <input type="text"
								id="booktitle" name="bsr_name" value="" />
						</tr>
						<tr>
							<td><label for="title">작가 :</label> <input type="text"
								id="author" value="" />
						</tr>
						<tr>
							<td><label for="fix_price">정가 : </label> <input type="text"
								id="fixedprice" name="bsr_fixed_price" value="" />
						</tr>
						<tr>
							<td><label for="bsr_category">카테고리 : </label> <select
								id="bookcategory" name="bsr_category">
									<option value="0">인문</option>
									<option value="1">역사</option>
									<option value="2">예술</option>
									<option value="3">종교</option>
									<option value="4">사회</option>
									<option value="5">과학</option>
									<option value="6">경제경영</option>
									<option value="7">자기계발</option>
									<option value="8">만화</option>
									<option value="9">라이트노벨</option>
									<option value="10">여행</option>
									<option value="11">잡지</option>
									<option value="12">어린이</option>
									<option value="13">요리</option>
									<option value="14">육아</option>
									<option value="15">건강</option>
									<option value="16">IT</option>
									<option value="17">자격증</option>
									<option value="18">참고서</option>

							</select>
						</tr>
						<tr>
							<td><label for="price">판매 희망가격 : </label> <textarea
									id="price" name="bsr_price"></textarea>
						</tr>
						<tr>
							<td><label for="content">소개글</label> <textarea id="content"
									name="bsr_comment"></textarea></td>
						</tr>
						<tr>
							<td><input type="file" name="img"></td>
						</tr>
						<tr>
							<td>
								<button type="submit">작성</button>
							</td>
						</tr>
					</tbody>

				</table>
			</form>
		</div>
		<hr />
	</div>
</body>

<script>
	function booksearch() {
		var keyword = $('.book').val();
		$
				.ajax({
					url : "/booksellregistajax", // controller에서 받는다
					type : "GET",
					data : {
						"keyword" : keyword
					},
					success : function(data) {
						var total = data.items.length;
						console.log("total : " + total);
						var info = "<tr class = 'trtop'><th>이미지</th><th>제목</th><th>저자</th><th>정가</th>"
						for (var i = 0; i < total; i++) {
							var title = data.items[i].title;
							title
									.replace(
											/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig,
											"");
							info += "<tr class='booktr'>";
							info += "<td><img class='booklist_img' src='"+data.items[i].image+"'/></td>";
							info += "<td class = 'searchTitle'> "
									+ data.items[i].title + "</td>";
							info += "<td class='author'>"
									+ data.items[i].author + "</td>";
							info += "<td class = 'price'>"
									+ data.items[i].price + "원" + "</td>";
							info += "</tr>";
						}
						$('#bookajax').html(info);
						$("#booklist").show();
					},
					error : function() {

					}
				});
	}
</script>
</html>