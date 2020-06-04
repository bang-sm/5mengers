<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<form>

		책 검색 : <input type="text" name="date" id="date">

		<button id="btn_load" type="button">검색</button>
		<button id="btn_remove" type="button">지우기</button>

	</form>
	<h2>찾은 책정보</h2>
	<br>
	<table id="demoXML"></table>

	<!-- 인터파크 api xml 파씽 -->
	<script type="text/javascript">

	var api_key = "C354034269C775DBCB54644F752E164B5CDEE06889FEE967C07621D697D3A30A"
		$(document).ready(function(){
		$("#btn_load").click(function(){
			 var date = document.getElementById("date").value.trim();
			 
			 // XML
			 var url = "http://book.interpark.com/api/search.api?key=" + api_key + "&interpark&query=" + data;
			
			$.ajax({
				url : url,
				type : "GET",
				cache : false,
				success : function(data, status){
					if(status == "success") parseXML(data);
				}
			});
			
			$("#btn_remove").click(function(){
				$("#demoXML").html("");
				$("#demoJSON").html("");
			 });
			
		 });
		
		function parseXML(xmlDOM) {
			var table = "<tr><th>호선</th><th>역명</th><th>승차인원</th><th>하차인원</th></tr>";
			$(xmlDOM).find("row").each(function(){
				table += "<tr>";
				table += "<td>" + $(this).find("SUB_STA_NM").text() + "</td>";
				table += "<td>" + $(this).find("RIDE_PASGR_NUM").text() + "</td>";
				table += "<td>" + $(this).find("ALIGHT_PASGR_NUM").text() + "</td>"; 		
				table += "</tr>";
			});
			$("#demoXML").html(table);
		}

</script>



	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />


		<div id='dis' style="display: none">

			<table>
				<tbody>
					<tr>
						<td>책 이름:</td>
					</tr>
					<tr>
						<td>저자 :</td>
						</td>
					<tr>
						<td>정가:</td>
						</td>
				</tbody>


			</table>

		</div>
		<input type="text" id="" placeholder="책 검색">
		<button id='show' onclick="dis()">show</button>




		<section id="container">
			<!-- Controller의 value값과 동일하게 해줄것 -->
			<form role="form" method="post" action="/booksellregistPage">
				<table>
					<tbody>
						<tr>
							<td><label for="title">책 이름 :</label>
						</tr>
						<tr>
							<td><label for="fix_price">정가 : </label>
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
		<hr />



	</div>
	<!-- 지도 나타내기 -->
	<div id="floating-panel">
		<input id="address" type="textbox" value="Sydney, NSW"> <input
			id="submit" type="button" value="Geocode">
	</div>
	<div id="map"></div>







</body>
</html>