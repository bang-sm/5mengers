<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>

<!-- 지도 style -->
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 400px;
	width: 600px;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#floating-panel {
	top: 10px;
	left: 25%;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}
</style>

<!-- 지도 script  -->

<script>
	function initMap() {
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 8,
			center : {
				lat : -34.397,
				lng : 150.644
			}
		});
		var geocoder = new google.maps.Geocoder();

		document.getElementById('submit').addEventListener('click', function() {
			geocodeAddress(geocoder, map);
		});
	}

	function geocodeAddress(geocoder, resultsMap) {
		var address = document.getElementById('address').value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status === 'OK') {
				resultsMap.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : resultsMap,
					position : results[0].geometry.location
				});
			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFofoZnDDbEIAGQ1dPQRKPlOGGbb5sgOE&callback=initMap">
</script>
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
</head>
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
		<!-- 지도 나타내기 -->
		<div id="floating-panel">
			<input id="address" type="textbox" value="Sydney, NSW"> <input
				id="submit" type="button" value="Geocode">
		</div>
		<div id="map"></div>
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