<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
body {
	margin: 0 300px 0 300px;
}

#article {
	width: 1200px;
	margin:0 auto;
	height: 600px;
	border: 1px solid black;
	position:relative;
}
#article2{
	width: 1200px;
	margin:0 auto;
	height: 500px;
}

.div_top {
	width: 100%;
	height:100px;
}

.book_title {
	position:absolute;
	top :10px;
	left:10px;
	margin: 10px 0 0 10px;
	font-size: 30px;
	font-weight: bold;
	float: left;
}

.zzim {
	float: right;
	font-size: 40px;
	font-weight: bold;
}

.zzim_img {
	width: 50px;
	height: 50px;
	margin: 5px 10px 0 0;
}

.div_middle_1 {
	height: 200px;
	
}

.book_img {
position:absolute;
left:50px;
float:left;
}

.book_detail {
position:absolute;
top:150px;
left:500px;
float:left;
}

.book_detail>div {
	margin-bottom: 20px;
}

.book_detail_title {
	font-size: 20px;
	font-weight: bold;
}

.book_regdate {
position:absolute;
top:350px;
height:50px;
margin-left: 100px;
font-weight: bold;
font-size:30px;

}
.div_middle_2{
height:300px;
}

.book_content {
	position:absolute;
	top:390px;
	left:500px;
}

.book_content_title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}
.book_zzim{
  position:absolute;
  top:500px;
  left:50px;
  font-weight:bold;
}
.toggle_img{
position:absolute;
top:-30px;
left:200px;
}
.book_zzim_img{
width:40px;
height:auto;
margin:20px 0 0 50px;
}
#map{
float:left;
}
.hope_map{
border: 1px solid black;
}
#map_detail{
float:left;
border: 3px solid black;
height: 100px;
margin: 100px 0 0 30px;
}
#article2{
margin-top:100px;
}
.article2_top{
 height:500px;
}

.aside_book{
 width:250px;
 height:700px;
 border:3px solid black;
 border-radius: 10px;
}

#aside{
  position:absolute;
  top:100px;
  right:-300px;
}

</style>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c641b7de37b235b224307fbe383e582&libraries=services"></script>
<body>

	<%@ include file="../common/head.jsp" %>

	<section id="section">
		<article id="article">
			<!--거래 상세 페이지 책 제목/설명/찜 개수 -->
			<div class="div_top">
				<div class="book_title">${detail.bsr_name}</div>
				<div class="zzim">
					<img class="zzim_img" alt="" src="/resources/site_img/total_heart.png"><span>${zzim.zzim}</span>
				</div>
			</div>
			<div class="div_middle_1">
				<div class="book_img">
					<!-- 사진 슬라이드(40%) -->
					<img alt=""
						src="http://blogfiles.naver.net/MjAyMDA0MDhfMjUx/MDAxNTg2MzMxMjE3MDg2.34gw57MUHQEUMzyqSwuSgbbkItgb5FFgB_ELnpH0Ib4g.-0tJRCwjPUDjxom5KfL7nnVWiBV-ch88TJWOHarDs1Qg.PNG.war041/noname01.png">
				</div>
				<div class="book_detail">
					<!-- 책 설명(판매자/장르/정가/판매가/휴대폰)(60%) -->
					<div>
						<span class="book_detail_title">판 매 자 :</span>${detail.name}
					</div>
					<div>
						<span class="book_detail_title">장 르 :</span>${detail.bsr_category}
					</div>
					<div>
						<span class="book_detail_title">정 가 :</span>${detail.bsr_fixed_price}원
					</div>
					<div>
						<span class="book_detail_title">판 매 가 :</span>${detail.bsr_price}원
					</div>
					<div>
						<span class="book_detail_title">휴 대 폰 :</span>${detail.phonenum}
					</div>


				</div>
				
			</div>
			<div class="div_middle_2">
				<div class="book_regdate">
					<!-- 등록일 -->
					${detail.bsr_regdate}
				</div>
				<div class="book_content">
					<!-- 코멘트 -->
					<div class="book_content_title">중고책 소개</div>
					<div>${detail.bsr_comment}</div>
				</div>
				<div class="book_zzim">
				<!-- 찜등록  -->
				<span>관심목록에 추가 하시겠습니까?</span>
				<div class="toggle_img"><img class="book_zzim_img" src="/resources/site_img/heart_off.png"></div>
				</div>
			</div>
			<script>
			<!-- 이미지 토글로 찜갯수 +1  -1 한다 -->
			</script>
			<aside id="aside">
			<!--같은 장르 추천 책-->
			<div class="aside_book">
			
			</div>
		</aside>

		</article>
		
		

		<article id="article2">
			<div class="article2_top">
				<div>
					<!--  지도(DB에서 위도,경도 값 받아서 스크립트에 넣기-->
					<div id="map" style="width: 600px; height: 350px;"></div>
				</div>
				<div >
					<!--  판매자 직거래 희망 지역 -->
				  
				   <div id="map_detail"></div>
				  
				</div>
			</div>
			<div>
				<div>
					<!--  버튼 들  -->
					<div></div>
					<c:if test="${detail.auth==2}"> 
						<input type=button value="글 삭제" onclick=""/>
						<input type=button value="글 수정" onclick=""/>
					</c:if>
					<input type=button value="구매 하기" onclick=""/>
					
				</div>
			</div>
		</article>
		
	</section>
		



	<footer> </footer>

</body>
<script>
var abc =${detail.map_x};
var def = ${detail.map_y};
console.log("위도 : "+abc +"경도 : "+def);
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(abc, def), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

var geocoder = new kakao.maps.services.Geocoder();

var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
	    $("#map_detail").text("판매자 직거래 희망 지역   : "+result[0].address_name);
    }
};

geocoder.coord2RegionCode(def, abc, callback);
</script>


</html>