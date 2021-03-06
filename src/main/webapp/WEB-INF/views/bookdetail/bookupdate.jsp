<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
<link rel="stylesheet" href="../resources/css/bookupdate.css?v1">
 <style>

</style>
</head>
<body>
<%@ include file="../common/head.jsp"%>


<div class="update-table">
	<form  method="post" action="/bookupdate_end" enctype="multipart/form-data" onsubmit="return check()">
		<div class="infoArea">
			<h3>
				<div style="width : 800px;color: blue; border: 1px solid blue; padding: 10px;">수정중</div>
			</h3>
		<div>
			<table style="width:800px;">
				<tbody>
					<tr class=" xans-record-">
						<th scope="row">
							<span style="font-size: 16px; color: #555555;">책이름</span></th>
						<td>
							<span style="font-size: 16px; color: #555555;">${bookupdate[0].bsr_name}</span>
					    </td>
					</tr>
					<tr class=" xans-record-">
						<th scope="row">
							<span style="font-size: 16px; color: #555555;">카테고리</span></th>
						<td>
							<span style="font-size: 16px; color: #555555;">${bookupdate[0].bc_name}</span>
					    </td>
					</tr>
					<tr class=" xans-record-">
						<th scope="row">
							<span style="font-size: 16px; color: #555555;">정가</span></th>
						<td>
							<span style="font-size: 16px; color: #555555;">${bookupdate[0].bsr_fixed_price}</span>
					    </td>
					</tr>
					<tr class=" xans-record-">
						<th scope="row">
							<span style="font-size: 16px; color: #555555;">희망 거래 위치 </span></th>
						<td>
							<textarea id="price" name="bsr_price" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' value="${bookupdate[0].bsr_price }">${bookupdate[0].bsr_price }</textarea>
					    </td>
					</tr>
					<tr class=" xans-record-">
						<th scope="row">
							<span style="font-size: 16px; color: #555555;">책소개글</span></th>
						<td>
							<textarea  id="content" name="bsr_comment">${bookupdate[0].bsr_comment }</textarea>
					    </td>
					</tr>
					<tr class=" xans-record-">
						<th scope="row">
							<span style="font-size: 16px; color: #555555;">직거래 희망 지역</span></th>
						<td>
							<input type="text" id="place"name="want" placeholder="바꿀 지역을 선택해주세요 !"value="" style="width:500px;"/>
					    </td>
					</tr>
					<tr class=" xans-record-">
						<th scope="row">
							<span style="font-size: 16px; color: #555555;">등록된 사진</span></th>
						<td>
							<c:forEach var="item" items="${bookupdate}">
								 <div class="img${item.bsr_img_id} deletediv appendpic">
									 <span>${item.bi_user_file_name }</span>
									 <button class="deletebtn"type="button" value="${item.bsr_img_id}">삭제</button>
									 <input class="file_name" type="hidden" value="${item.bi_file_name}">
								 </div>
							</c:forEach>
					    </td>
					</tr>
					<tr class=" xans-record-">
						<th scope="row">
							<span style="font-size: 16px; color: #555555;">사진 첨부</span><button type="button" class="appendimg">사진 추가</button></th>
						<td>
							<div class="newimg"></div>
					    </td>
					</tr>


				</tbody>
			</table>
		</div>
		<input type='hidden' name="bsr_id" value="${bookupdate[0].bsr_id }"/>
		<input type='hidden' name="map_x" value="${bookupdate[0].map_x}"/>
		<input type='hidden' name="map_y" value="${bookupdate[0].map_y}"/>	
	</div>
	<button style="width:100%;margin-top:20px;" type="submit" onclick="checkFile()" value="regist">글 등록</button>
	</form>
	
	
</div>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div class="keyword-button">
		         <input type="text" value="이태원 맛집" id="keyword" size="30"> 
            </div>
            <button class="map_btn">검색하기</button> 
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
    
    <div class="map_juso"style="width:300px;height:200px;font-size:10px;"></div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
<script>
function update(){
	location.href="/";
}
</script>
<script>
var count=0;
$(".appendimg").click(function(){	
	//3개 이상 5개 이하만 추가 할수 있다
	var imgcount = $('.appendpic').length;
	if(imgcount<5){
		$('.newimg').append('<div class="fileappend"><input class="appendpic" type="file" name="img'+count+'"/><button type="button" class="del">삭제</button>');
		count++;
	}else{
		alert("최대 5까지 사진을 첨부할 수 있습니다!")
	}
	
});
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c641b7de37b235b224307fbe383e582&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(${bookupdate[0].map_x}, ${bookupdate[0].map_y}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});


// 키워드로 장소를 검색합니다
$('.map_btn').click(function(){
searchPlaces();
})

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info" onclick="clicker(this)">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
 //list 에서 클릭한 주소값 불러오기
function clicker(id){
	var juso =  $(id).children("span").first().text();
	var bigjuso = $(id).children("h5").text();
	$('input[name=want]').val(juso+"("+bigjuso+")"); //input 창에 입력해주기
	
	 var geocoder1 = new kakao.maps.services.Geocoder();
	 var callback = function(result, status) {
	     if (status === kakao.maps.services.Status.OK) {
	         $('input[name=map_y]').val(result[0].x);   //위도
	         $('input[name=map_x]').val(result[0].y);   //경도
	     }
	 };

	 geocoder1.addressSearch(juso, callback);
}
map.setDraggable(false); //맵 이동 금지    
map.setZoomable(false); //맵 드래그 금지
 
 
var geocoder = new kakao.maps.services.Geocoder();
var abc=$('input[name=map_x]').val();
var def=$('input[name=map_y]').val();
var coord = new kakao.maps.LatLng(abc, def);

var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
    	$('input[name=want]').val(result[0].address.address_name+"("+result[0].road_address.building_name+")");
    }
};

geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
 
 



</script>

<script>



$(document).ready(function(){
	$(".deletebtn").on("click",function(){
		var img_id=$(this).val();
		var img_filename=$(this).next(".file_name").val();
		console.log("deleteimg클릭");
		$.ajax({
			  url:"/deleteimagefile",
			  type:"GET",
			  data :{  
				  "bsr_img_id" : img_id,
				  "bi_file_name" : img_filename
			  },
			  success : function(){
					$('.img'+img_id).remove();
					
			  }
		  });
	});
	
	
	
});
$(document).on("click",".del",function(){
	$(this).parent('.fileappend').remove();
}); 



function check(){
	var imgnum=0;
	var undefinenum=0;
	if ($("#price").val() == ""){
		alert("희망 가격을 입력해주세요")
		$("#price").focus();
		return false;
	}
	
	if ($("#place").val() == ""){
		alert("거래 위치를 선택해 주세요")
		return false;
	}
	
	if ($("#content").val() == ""){
		alert("책 소개글을 입력해주세요")
		$("#content").focus();
		return false;
	}
	
	var imgcount = $('.appendpic').length; //인풋의 개수
	for(i=0;i<imgcount;i++){
		if($("input[name=img"+i+"]").val() =="" ){
		 	undefinenum++;
		}else{
			imgnum++;
		}
		if(!($("input[name=img"+i+"]").val().match(reg)) ){
			alert("업로드한 파일은 이미지 파일이 아닙니다")
			return false;
		}
	} 
	if(imgnum<3 || imgnum >5 || undefinenum !=0){
		alert("사진은 3장부터 5장까지 첨부 하셔야 합니다!");
		return false;
	}
	var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
	
	
	if(!($(".appendpic").val().match(reg)) ){
		alert("업로드한 파일은 이미지 파일이 아닙니다")
		return false;
	}
	
	alert("책 등록에 성공하셨습니다.");
	
	return true;
	
}

function checkFile(){
	var fm = document.fileForm;
	var fnm = fm.regist;
	var ext = fnm.value;
	
	if(!(ext.substr(ext.length-3)=='jsp' || ext.substr(ext.length-3)=='jpg')||ext.substr(est.length-3)=='png')
	{
		alert("사진 파일만 올릴 수 있습니다");
		return false;
	}
	fm.submit();
} 
</script>

<!-- <script> //포커스가 가끔 안잡혀서 보류
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        return false;
}
 
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script> -->
</html>