
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
<link rel="stylesheet" href="../resources/css/detail.css?v1">
<link rel="stylesheet" href="../resources/css/slick.css">
<link rel="stylesheet" href="../resources/css/slick-theme.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c641b7de37b235b224307fbe383e582&libraries=services"></script>
	
	<style>
	
	</style>
</head>
<body >

	<%@ include file="../common/head.jsp"%>	
	<div class="book_popup">
		<h3>해당 제품을 구매하시겠습니까?</h3>
		<input class="book_popup_ok info" type="button" value="구매합니다" /> <input
			class="book_popup_no info" type="button" value="좀더 둘러볼께요.." />
	</div>
	<div id="container">
		<div id="aside">
			<!--같은 장르 추천 책-->
			<div class="side_category">${detail.bc_name}</div>
			<div class="aside_book">
			
				<ul id="book_ul">
				
					<c:forEach var="side" items="${side_book}">
					<li class="book_li">
						<a href="${contextPath}/bookdetail?bsr_id=${side.bsr_id }&uuid=${side.uuid}&bsr_category=${side.bsr_category}">
							<div class="side_img"><img src="${contextPath}/bookimg/${side.img}" width="200px" height="200px"></div>
							<div class="side_name">${side.bsr_name }</div>
							<div class="side_fixed_price">정가 : ${side.bsr_fixed_price }</div>
							<div class="side_price">판매가 : ${side.bsr_price }원</div>
						</a>
					</li>
					</c:forEach>
				</ul>

			</div>
		</div>
		<div id="contents">
		<div id="map" style="width: 700px; height: 300px;position: absolute;bottom:-600px;"></div>
			<div class="xans-element- xans-product xans-product-detail">
				<div class="detailArea">

					<!-- IMAGE 영역 -->
					<div class="xans-element- xans-product xans-product-image imgArea ">
						<div class="swiper-body">
							<div class="zzim">
								<a href="#none" class="roll buy">
									<c:set value='<%=request.getParameter("bsr_id")%>' var="bsr_id" />
									<c:choose>
										<c:when
											test="${zzim_check.uuid == login.uuid and  zzim_check.bsr_id == bsr_id}">
											<img class="book_zzim_img" alt="" src="../resources/site_img/zzim_on.png"/>
										</c:when>
										<c:otherwise>
											<img class="book_zzim_img" alt="" src="../resources/site_img/zzim_off.png">
										</c:otherwise>
								   </c:choose>
								</a>
								<div class="zzim_count">${zzim.zzim}</div>
							</div>
									<div class="slider slider-single">
										<c:forEach var="topimg" items="${bookimg}">
										<div><img src="${contextPath}/bookimg/${topimg.bi_file_name}" alt="사진 X" style="width:400px;height:400px;"></div>
										</c:forEach>
								    </div>
									<div class="slider slider-nav">
									 	<c:forEach var="topimg" items="${bookimg}">
										<div><img src="${contextPath}/bookimg/${topimg.bi_file_name}" alt="사진 X" style="width:100px;height:100px;"></div>
										</c:forEach>
								   </div>
						</div>
						
					</div>
					<div class="infoArea">

						<div id="sangse_name" class="">

							<h3>
								<c:choose>
									<c:when test="${detail.bsr_status == 0 }">
										<div class="book_confirm"
											style="color: red; border: 1px solid red; padding: 10px;">
											게시글 비활성화</div>
									</c:when>
									<c:when test="${detail.bsr_check == 0 && detail.bsr_status == 1 }">
										<div class="book_confirm"
											style="color: red; border: 1px solid red; padding: 10px;">
											예약중</div>
									</c:when>
									<c:when test="${detail.bsr_check == 2 && detail.bsr_status == 0}">
										<div class="book_confirm" style="color: red; border: 1px solid red;">삭제됨</div>
									</c:when>
									<c:when test="${detail.bsr_check == 1 && detail.bsr_status == 0}">
										<div class="book_confirm" style="color: blue">판매완료</div>
									</c:when>
									<c:otherwise>
										<div class="book_confirm"
											style="color: blue; border: 1px solid red; padding: 10px;">
											판매중</div>
									</c:otherwise>
								</c:choose>
							</h3>
						</div>
						<div class="xans-element- xans-product xans-product-detaildesign">
							<table border="1">
								<tbody>
									<tr class=" xans-record-">
										<th scope="row">
											<span style="font-size: 16px; color: #555555;">책이름</span></th>
										<td>
											<span style="font-size: 16px; color: #555555;">${detail.bsr_name }</span>
										</td>
									</tr>
									<tr class=" xans-record-">
										<th scope="row">
											<span style="font-size: 12px; color: #555555;">장르</span>
										</th>
										<td><span style="font-size: 12px; color: #555555;"><span
												id="span_product_price_custom">${detail.bc_name}</span></span></td>
									</tr>
									<tr class=" xans-record-">
										<th scope="row">
											<span style="font-size: 12px; color: #555555;">판매가격</span>
										</th>
										<td><span style="font-size: 12px; color: #555555;"><span
												id="span_product_price_custom">${detail.bsr_price}</span></span></td>
									</tr>
									<tr class=" xans-record-">
										<th scope="row"><span
											style="font-size: 12px; color: #555555; font-weight: bold;">책 정가</span></th>
										<td>
											<strong id="span_product_price_text">${detail.bsr_fixed_price}
											</strong>
										</td>
									</tr>
									<tr class=" xans-record-">
										<th scope="row" colspan="2" style="text-align: center;">
										<span
											style="font-size: 12px; color: #555555; font-weight: bold;">중고책 소개</span>
										</th>
									</tr>
									<tr class=" xans-record-">
										<td scope="row" colspan="2">
										<span
											style="font-size: 12px; color: #555555; font-weight: bold;">${detail.bsr_comment}</span>
										</td>
									</tr>
									<tr class=" xans-record-">
										<th scope="row">
											<span style="font-size: 12px; color: #555555;">연락처</span>
										</th>
										<td>
											<span id="span_product_price_custom">${detail.phonenum}</span>
										</td>
									</tr>
									<tr class=" xans-record-">
										<th scope="row">
											<span style="font-size: 12px; color: #555555;">등록일</span>
										</th>
										<td>
											<span id="span_product_price_custom">${detail.bsr_regdate}</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="xans-element- xans-product xans-product-action ">
							<div class="btnArea">
								<c:choose>
								<c:when test="${login.uuid == detail.uuid && detail.bsr_check ==3 && detail.bsr_status== 1}">
									<button onclick="deletebtn()">글삭제</button>
									<button onclick="bookupdate()">글수정</button>
									<form  id="bookactive" method="get" action="/bookactive">
					                <input type="hidden" name ="bsr_id" value="${detail.bsr_id}"/>
					                <input type="hidden" name ="uuid" value="${detail.uuid}"/>
					                <input type="hidden" name ="bsr_category" value="${detail.bsr_category}"/>
									<button  type="submit" name = "bsr_status" value="0" onclick="active()">게시글 비활성화 시키기</button>
									</form>
								</c:when>
								<c:when test="${login.uuid == detail.uuid && detail.bsr_check ==3 && detail.bsr_status== 0}">
									<button onclick="deletebtn()">글삭제</button>
									<button onclick="bookupdate()">글수정</button>
									<form id="bookactive" method="get" action="/bookactive">
									<input type="hidden" name ="bsr_id" value="${detail.bsr_id}"/>
					                <input type="hidden" name ="uuid" value="${detail.uuid}"/>
					                <input type="hidden" name ="bsr_category" value="${detail.bsr_category}"/>
									<button  type="submit" name = "bsr_status" value="1" onclick="active()">게시글 활성화 시키기</button>
									</form>
								</c:when>
								<c:otherwise>
								
								</c:otherwise>
								</c:choose>
								<a href="#none" class="roll buy info">
									<span style="background-color:red">구매요청</span>
								</a> 
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<br>
</body>
<script src="../resources/js/bookdetail.js"></script>
<script src="../resources/js/slick.min.js"></script>

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
			if(${login.uuid}==${detail.uuid}){
				alert("자신의 게시글을 찜할수 없습니다.!");
			}else{
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

			              }
			           });
			           $(this).attr('src','../resources/site_img/zzim_off.png');
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
			              }
			           });  
			           $(this).attr('src','../resources/site_img/zzim_on.png');
			        }
			     }
			});

			  
	     
		
		//구매하기 버튼 클릭시 ajax 
		  $('.info').click(function(){
			  
			  if(${detail.bsr_check} == 3){
				  if(${login.uuid} != ${detail.uuid}){ 
					  
					  $.ajax({
								url:"/bookactivecount", 
								type:"GET",
								data:{
									"bsr_id":${detail.bsr_id}
								},
								success : function(data){
									if(data == 1 ){
										 $.ajax({
											  url:"/book_check",
							        		  type:"GET",
							        		  data :{ 
							        			  "bsr_check" : 0,
							        			  "bsr_id" : ${detail.bsr_id}
							        		  },
							        		  //updata 컬럼 상태 받아오기 (bsr_check(수정상태 ) 값 가져오기)
							        		  success : function(){
							        		  }
									  	});
										alert("해당 상품을 예약하셨습니다. 마이페이지로 이동합니다.");
										location.href="${contextPath}/my/nav" 
									}else{
										 alert("현재 판매자가 게시글을 수정하고 있습니다.");
									}
								}
					   });	  
						  
					  //판매자가 게시글을 수정 하고 있는지 확인 여부  (data : 현재 게시글 번호)
					 
					  }else{
						  alert("판매자는 구매할수 없습니다!");
					  }
				
			  }else{
				  alert("해당 상품을 구매요청 하실수 없습니다!");
			  }
		  });
			  
		  
		   
         </script>
	</c:otherwise>
</c:choose>
<script>
function deletebtn(){
	var check = confirm("해당 게시글을 삭제 하시겠습니까?");
	if(check){
		$.ajax({
			url:"/book_delete",
			type:"GET",
			data:{
				"bsr_id":${detail.bsr_id}
			},
			success : function(){
				alert("해당 게시글이 삭제 되었습니다.")
			}  
		}); 
		location.href="${contextPath}";
	}
}

</script>
<script>
function bookupdate(){
	$.ajax({
		url:"/bookactivecount",
		type:"GET",
		data:{
			"bsr_id":${detail.bsr_id} 
		},
		success : function(data){
			if(data ==1 ){
				alert("먼저 게시글을 비활성화 시켜주세요!");
			}else{
				var check = confirm("글 수정 하시겠습니까 ? ");
				if(check){
					location.href="${contextPath}/bookupdate?bsr_id="+${detail.bsr_id};
				}
			}
		}
	});
}
</script>
<script>
function active(){
	$('#bookactive').submit();
}

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
var coord = new kakao.maps.LatLng(abc, def);
var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
	    $("#map_detail").html("<div style='font-size:20px;font-weight:bold;'>판매자 직거래 희망 지역</div><br><div></div><br><div class='map_address'>"+result[0].address.address_name+"</div>");
    }
};

geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);

var new_map =$('.map_border').parent().parent();
new_map.css("border","1px solid blue");
new_map.css("border-radius","10px");

var swiper = new Swiper('.swiper-container', {
    pagination: {
      el: '.swiper-pagination',
    },
  });
</script>


</html>