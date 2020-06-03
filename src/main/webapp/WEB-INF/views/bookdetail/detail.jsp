<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 상세 페이지</title>

<style>
body {
	margin: 0 300px 0 300px;
}

#article {
	width: 1200px;
	margin: 0 auto;
	height: 600px;
	border: 1px solid black;
	position: relative;
}

#article2 {
	width: 1200px;
	margin: 0 auto;
	height: 500px;
	position: relative;
}

.div_top {
	width: 100%;
	height: 100px;
}

.book_title {
	position: absolute;
	top: 10px;
	left: 10px;
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
	float: left;
	margin: 20px 30px 0 0;
}

.zzim_count {
	float: left;
	font-size: 50px;
	margin: 20px 10px 0 0;
}

.div_middle_1 {
	height: 200px;
}

.book_img {
	position: absolute;
	left: 50px;
	float: left;
}

.book_detail {
	position: absolute;
	top: 150px;
	left: 500px;
	float: left;
}

.book_detail>div {
	margin-bottom: 20px;
}

.book_detail_title {
	font-size: 20px;
	font-weight: bold;
}

.book_regdate {
	position: absolute;
	top: 400px;
	height: 50px;
	margin-left: 100px;
	font-weight: bold;
	font-size: 30px;
}

.div_middle_2 {
	height: 300px;
}

.book_content {
	position: absolute;
	top: 390px;
	left: 500px;
}

.book_content_title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}

.book_zzim {
	position: absolute;
	top: 500px;
	left: 50px;
	font-weight: bold;
}

.toggle_img {
	position: absolute;
	top: -30px;
	left: 200px;
}

.book_zzim_img {
	width: 40px;
	height: auto;
	margin: 20px 0 0 50px;
}

#map {
	float: left;
}

.hope_map {
	border: 1px solid black;
}

#map_detail {
	float: left;
	border: 3px solid black;
	height: 100px;
	margin: 100px 0 0 30px;
}

#article2 {
	margin-top: 100px;
}

.article2_top {
	height: 500px;
}

.aside_book {
	width: 250px;
	height: 700px;
	border: 3px solid black;
	border-radius: 10px;
}

#aside {
	position: absolute;
	top: 100px;
	right: -300px;
}

.buy_button {
	position: absolute;
	top: 400px;
	left: 1000px;
}

.info {
	background-color: #2196F3;
} /* Blue */
.info:hover {
	background: #0b7dda;
}

.danger {
	background-color: #f44336;
} /* Red */
.danger:hover {
	background: #da190b;
}

.book_popup {
	width: 450px;
	height: 170px;
	border: 1px solid black;
	border-radius: 10px;
	position: absolute;
	top: 700px;
	left: 600px;
	display: none;
	background-color: lightgray;
}

.book_popup h3 {
	font-size: 30px;
	font-weight: bold;
	margin: 0 0 100px 0;
}

.book_popup_ok {
	width: 150px;
	height: 30px;
	border: 1px solid black;
	border-radius: 2px;
}

.book_popup_no {
	width: 150px;
	height: 30px;
	border: 1px solid black;
	border-radius: 2px;
}

.book_confirm {
	position: absolute;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	top: 25px;
	left: 900px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c641b7de37b235b224307fbe383e582&libraries=services"></script>
</head>
<body>

	<%@ include file="../common/head.jsp"%>

	<section id="section">
		<article id="article">
			<!--거래 상세 페이지 책 제목/설명/찜 개수 -->
			<div class="div_top">
				<div class="book_title">${detail.bsr_name}</div>
				<div class="zzim">
					<img class="zzim_img" alt=""
						src="/resources/site_img/total_heart.png">
					<div class="zzim_count">${zzim.zzim}</div>
				</div>
			</div>
			<div class="div_middle_1">
				<div class="book_img">
					<!-- 사진 슬라이드(40%) -->
					<img alt="" style="width: 200px; height: auto"
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimage.nmv.naver.net%2Fblogucc28%2F2017%2F07%2F08%2F448%2F506e27a24cc2ebbd547b7de4a3d741176e18_ugcvideo_270P_01_16x9_logo.jpg&type=b400">
				</div>

				<c:choose>
					<c:when test="${detail.bsr_check == 3}">
						<div class="book_confirm"
							style="color: blue; border: 1px solid blue; padding: 10px;">
							판매중</div>
					</c:when>
					<c:when test="${detail.bsr_check == 2}">
						<div class="book_confirm" style="color: blue">삭제됨</div>
					</c:when>
					<c:when test="${detail.bsr_check == 1}">
						<div class="book_confirm" style="color: blue">판매완료</div>
					</c:when>
					<c:otherwise>
						<div class="book_confirm"
							style="color: red; border: 1px solid red; padding: 10px;">
							예약중</div>
					</c:otherwise>
				</c:choose>

				<div class="book_detail">

					<!-- 책 설명(판매자/장르/정가/판매가/휴대폰)(60%) -->
					<div>
						<span class="book_detail_title">판 매 자 :</span>${detail.name}
					</div>
					<div>
						<span class="book_detail_title">장 르 :</span>${detail.bc_name}
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
					<c:set value='<%= request.getParameter("bsr_id") %>' var="bsr_id"/>
					<c:choose>
					<c:when
							test="${zzim_check.uuid == login.uuid and  zzim_check.bsr_id == bsr_id}">
							${bsr_id }
							<img class="book_zzim_img" alt=""
								src="/resources/site_img/heart_on.png">
						</c:when>
						<c:otherwise>
							<img class="book_zzim_img" alt=""
								src="/resources/site_img/heart_off.png">
						</c:otherwise>
					</c:choose>
					
						
				</div>
			</div>


			<aside id="aside">
				<!--같은 장르 추천 책-->
				<div class="aside_book"></div>
			</aside>

		</article>
		<div class="book_popup">
			<h3>해당 제품을 구매하시겠습니까?</h3>
			<input class="book_popup_ok info" type="button" value="구매합니다" /> <input
				class="book_popup_no info" type="button" value="좀더 둘러볼께요.." />
		</div>


		<article id="article2">
			<div class="article2_top">
				<div>
					<!--  지도(DB에서 위도,경도 값 받아서 스크립트에 넣기-->
					<div id="map" style="width: 600px; height: 350px;"></div>
				</div>
				<div>
					<!--  판매자 직거래 희망 지역 -->

					<div id="map_detail"></div>

				</div>
			</div>
			<div>
				<div class="buy_button">
					<!--  버튼 들  -->
					<div></div>
					<c:if test="${detail.auth==2}">
						<input type=button value="글 삭제" onclick="" />
						<input type=button value="글 수정" onclick="" />
					</c:if>
					<c:choose>
						<c:when test="${detail.bsr_check ==3 }">
							<input class="btn info" style="width: 100px; height: auto"
								type=button value="구매 하기" />
						</c:when>
						<c:when test="${detail.bsr_check ==1 }">
							<input class="btn info" style="width: 100px; height: auto"
								type=button value="판매완료" />
						</c:when>
						<c:otherwise>
							<input class="btn danger" style="width: 100px; height: auto"
								type=button value="예약 중" />
						</c:otherwise>
					</c:choose>


				</div>
			</div>

		</article>

	</section>




	<footer> </footer>

</body>
<script>
         $('.book_zzim_img').click(function(){
            var allowsrc = $(this).attr('src');
            
            if(allowsrc.match('on')){
               //찜이 이미 눌러져있다  -> 찜 해제
               $.ajax({
                  url: "/zzimoff", //매핑
                  type: "GET",
                  data :  {
                     "uuid" : ${login.uuid},
                     "bsr_id" : <%=request.getParameter("bsr_id")%>
             
                  },
                  success : function(){
                	  $.ajax({
                		  url:"/zzimcount",
                		  type:"GET",
                		  data :{  
                			  "bsr_id" : <%=request.getParameter("bsr_id")%>
                		  },
                		  success : function(data){
                			  $('.zzim_count').text(""+data);
                		  }
                	  });

                  }, 
                  error : function(){
                  }
               });
            $('.book_zzim_img').attr("src","/resources/site_img/heart_off.png");
            }else{
               //찜이 안눌러 져있다  ->찜 등록
               $.ajax({
                  url: "/zzimon", //매핑
                  type: "GET",
                  data :  {
                	  "uuid" : ${login.uuid},
                      "bsr_id" : <%=request.getParameter("bsr_id")%>
                  },
                  success : function(){
                	  $.ajax({
                		  url:"/zzimcount",
                		  type:"GET",
                		  data :{ 
                			  "bsr_id" : <%=request.getParameter("bsr_id")%>
                		  },
                		  success : function(data){
                			  $('.zzim_count').text(""+data);
                		  }
                	  });
                  },
                  error : function(){
                  }
               });
               $('.book_zzim_img').attr("src","/resources/site_img/heart_on.png");
            }
         });
        
         </script>
<script>
			  $('.info').click(function(){
				  $('.book_popup').show();
			  })
			  
			  $('.book_popup_ok').click(function(){
				  $.ajax({
            		  url:"/book_check",
            		  type:"GET",
            		  data :{ 
            			  "bsr_check" : 0,
            			  "bsr_id" : ${detail.bsr_id}
            		  },
            		  success : function(){
            		  }
            	  });
				  location.href="http://localhost:8080/bookdetail";
			  })
			   $('.book_popup_no').click(function(){
				   $('.book_popup').hide();
			  })
			</script>
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