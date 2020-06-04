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
<link rel="stylesheet" href="../resources/css/detail.css">
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
					<c:set value='<%=request.getParameter("bsr_id")%>' var="bsr_id" />
					<c:choose>
						<c:when
							test="${zzim_check.uuid == login.uuid and  zzim_check.bsr_id == bsr_id}">
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


			<div id="aside">
				<!--같은 장르 추천 책-->
				<div class="aside_book">
					<ul id="book_ul">
						<c:forEach var="side" items="${side_book}">
							<a
								href="http://localhost:8080/bookdetail?bsr_id=${side.bsr_id }&uuid=${side.uuid}&bsr_category=${side.bsr_category}">
								<li class="book_li"><img
									style="width: 100%; height: 200px;" class="side_book_img"
									alt=""
									src="http://imgnews.naver.net/image/112/2013/05/02/20130502000285_0_59_20130502093112.jpg">
									<div class="side_name">${side.bsr_name }</div>
									<div class="side_fixed_price">정가 : ${side.bsr_fixed_price }원</div>
									<div class="side_price">판매가 : ${side.bsr_price }원</div></li>
							</a>

						</c:forEach>
					</ul>

				</div>
			</div>

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
					<div id="map" style="width: 1200px; height: 500px;"></div>
				</div>
			</div>
			<div>
				<div class="buy_button">
					<!--  버튼 들  -->
					<div></div>
					<c:if test="${login.uuid == detail.uuid}">
						<input type=button value="글 삭제" onclick="" />
						<a
							href="${contextPath}/bookupdate?bsr_id=<%=request.getParameter("bsr_id")%>">글
							수정</a>
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
<c:choose>
	<c:when test="${empty login}">
		<script>
	 $('.book_zzim_img').click(function(){
		 alert("로그인 하세요");
		  location.href="${path}/user/login";
	 })
	  $('.info').click(function(){
		 alert("로그인 하세요");
		  location.href="${path}/user/login";
	 })
	 
	</script>
	</c:when>
	<c:otherwise>
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
	            	  alert("로그인해라");
	              }
	           });
	           $('.book_zzim_img').attr("src","/resources/site_img/heart_on.png");
	        }
	     });

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
	</c:otherwise>
</c:choose>
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

map.setDraggable(false); //맵 이동 금지    
map.setZoomable(false); //맵 드래그 금지

var imageSrc = '../resources/site_img/marker.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(50, 67), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(abc, def); // 마커가 표시될 위치입니다

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition, 
image: markerImage // 마커이미지 설정 
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  

//인포윈도우 (마커 위에 주소)
var iwContent = '<div class="map_border" style="padding:5px;width:300px;height:70px"><div id="map_detail"></<div> <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(abc, def); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

var geocoder = new kakao.maps.services.Geocoder();

var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
	    $("#map_detail").html("<div style='font-size:20px;font-weight:bold;'>판매자 직거래 희망 지역</div>   <br><div class='map_address'>"+result[0].address_name+"</div>");
    }
};

geocoder.coord2RegionCode(def, abc, callback);

var new_map =$('.map_border').parent().parent();
new_map.css("border","1px solid blue");
new_map.css("border-radius","10px");
</script>

</html>