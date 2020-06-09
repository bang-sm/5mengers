<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>


</head>

<!-- jquery 사용을 위한 src -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- none -> block -->
<script type="text/javascript">
	function dis() {
		if ($('#dis').css('display') == 'none') {
			$('#dis').show();
		} else {
			$('#dis').hide();
		}
	}
</script>




<body>
<input class="book"type="text" name="title" value="책 이름 "/>
<button class="bookbtn" onclick="booksearch()">책 검색</button>
	<div id="booklist">
		<div id="booklist_div">
			<ul id="booklist_ul">
			<table id ="bookajax"></table>
			</ul>
		</div>
	</div>

	<div id="root">
		<header>
		<h1>게시판</h1>
		</header>
		<hr />
		<nav>홈 - 글 작성</nav>
		<hr />
		<div id='dis' style="display: none">

			
		</div>
		<button id='show' onclick="dis()">show</button>
		<section id="container">      <!-- Controller의 value값과 동일하게 해줄것 -->
			<form name="form" method="post" action="/booksellregistPage" enctype="multipart/form-data">
				<table>
					<tbody>
						<tr>
							<td><label for="title" >책 이름 :</label>
						</tr>
						<tr>
							<td><label for="fix_price" >정가 : </label>
						</tr>
						<tr>
							<td><label for="price">판매 희망가격 : </label> <textarea id="price" name="bsr_price"></textarea>
						</tr>
						<tr>
							<td><label for="content">소개글</label> <textarea id="content" name="bsr_comment"></textarea></td>
						</tr>
						<tr>
							<td><input type="file" name="file"></td>
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
			<hr/>
		</div>
		
</body>

<script>
function booksearch(){
	var keyword = $('.book').val();
	alert("keyword : " + keyword);
	$.ajax({
		url: "/booksellregistajax", // controller에서 받는다
					type : "GET",
					data : {
						"keyword" : keyword
					},
					success : function(data) {
						var total = data.items.length;
						console.log("total : " + total);
						var info = "<tr><th>이미지</th><th>제목</th><th>저자</th><th>정가</th>"
						// "책 제목 : "+jemok +"<br>가격 : "+price +"<br>저자 : "+author +"사진 : "+"<img src='"+image+"'/>";
						for (var i = 0; i < total; i++) {
							info += "<li class='booklist_li'><tr>";
							info += "<td><img class='booklist_img' src='"+data.items[i].image+"'/></td>";
							info += "<td>" + data.items[i].title + "</td>";
							info += "<td>" + data.items[i].author + "</td>";
							info += "<td>" + data.items[i].price + "</td>";
							info += "</tr></li>";
						}
						$('#bookajax').html(info);
					},
					error : function() {

					}
				});

	}
</script>
</html>