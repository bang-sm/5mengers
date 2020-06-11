<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>글 등록 게시판</title>
<link >
<link rel="stylesheet" href="../resources/css/booksellregistPage.css">
</head>
<%@ include file="../common/head.jsp"%>

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

<!-- 필수요소 체크  -->
<script type="text/javascript">
function check(){
	var imgnum=0;
	var undefinenum=0;
	if ($("#booktitle").val() == ""){
		alert("책을 검색해주세요")
		$("#booktitle").focus();
		return false;
	}
	
	if ($("#bsr_category").val() == ""){
		alert("책 카테고리를 확인해주세요")
		return false;
	}
	
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
	
	
	return true
	
}
</script>

<!-- 책 API list style -->
<style>
#bookajax .booktr:hover {
	background-color: #CEE3F6;
}
</style>


<body>
<!--책 검색 버튼 클릭시 해당 div 나옴  -->
	<div id="booklist">
		<div id="booklist_div">

			<table id="bookajax"></table>

		</div>
	</div>

<div class="insert-table">	
	<form name="form" method="post" action="/booksellregistPage" enctype="multipart/form-data" onsubmit="return check()">
	<div class="insert_title">글 작성</div>
	<table style="width:800px;">
		<tbody>
			<tr class=" xans-record-">
				<th scope="row">
					<span style="font-size: 16px; color: #555555;">책 등록</span>
				</th>
				<td>
					<span style="font-size: 16px; color: #555555;">
						<input class="book" type="text" name="title" placeholder="책 이름을 입력해주세요!" />
						<button type ="button"class="bookbtn" onclick="booksearch()">책 검색</button>
					</span>
			    </td>
			</tr>
			
			<tr class=" xans-record-">
				<th scope="row">
					<span style="font-size: 16px; color: #555555;">책 이름 :</span>
				</th>
				<td>
					<span style="font-size: 16px; color: #555555;">
						<input type="text" id="booktitle" name="bsr_name" value="" readonly />
					</span>
			    </td>
			</tr>
			<tr class=" xans-record-">
				<th scope="row">
					<span style="font-size: 16px; color: #555555;">작가 :</span>
				</th>
				<td>
					<span style="font-size: 16px; color: #555555;">
						<input type="text" id="author" value="" readonly/>
					</span>
			    </td>
			</tr>
			<tr class=" xans-record-">
				<th scope="row">
					<span style="font-size: 16px; color: #555555;">정가 :</span>
				</th>
				<td>
					<span style="font-size: 16px; color: #555555;">
						<input type="text" id="fixedprice" name="bsr_fixed_price" value="" readonly />
					</span>
			    </td>
			</tr>
			<tr class=" xans-record-">
				<th scope="row">
					<span style="font-size: 16px; color: #555555;">카테고리 :</span>
				</th>
				<td>
					<span style="font-size: 16px; color: #555555;">
						<select id="bookcategory" name="bsr_category">
									<option value="1">인문</option>
									<option value="2">역사</option>
									<option value="3">예술</option>
									<option value="4">종교</option>
									<option value="5">사회</option>
									<option value="6">과학</option>
									<option value="7">경제경영</option>
									<option value="8">자기계발</option>
									<option value="9">만화</option>
									<option value="10">라이트노벨</option>
									<option value="11">여행</option>
									<option value="12">잡지</option>
									<option value="13">어린이</option>
									<option value="14">요리</option>
									<option value="15">육아</option>
									<option value="16">건강</option>
									<option value="17">IT</option>
									<option value="18">자격증</option>
									<option value="19">참고서</option>
						</select>
					</span>
			    </td>
			</tr>
			<tr class=" xans-record-">
				<th scope="row">
					<span style="font-size: 16px; color: #555555;">판매 희망가격 :</span>
				</th>
				<td>
					<span style="font-size: 16px; color: #555555;">
						<textarea id="price" name="bsr_price" onkeyPress="InpuOnlyNumber(this)"></textarea>
					</span>
			    </td>
			</tr>
			<tr class=" xans-record-">
				<th scope="row">
					<span style="font-size: 16px; color: #555555;">희망 거래 위치 :</span>
				</th>
				<td>
					<span style="font-size: 16px; color: #555555;">
						<input type="text" id="place"    class="map_juso" onkeypress="InpuOnlyNumber(obj)" readonly/>
					</span>
			    </td>
			</tr>
			<tr class=" xans-record-">
				<th scope="row">
					<span style="font-size: 16px; color: #555555;">소개글</span>
				</th>
				<td>
					<span style="font-size: 16px; color: #555555;">
						<textarea  id="content" name="bsr_comment"></textarea>
					</span>
			    </td>
			</tr>
			<tr class=" xans-record-">
				<th scope="row">
					<span style="font-size: 16px; color: #555555;">사진 첨부</span>
					<button type="button" class="appendimg">사진 추가</button></th>
				<td>
					<div class="newimg"></div>
			    </td>
			</tr>
			<tr>
				<input type="hidden" class="map_x" name="map_x" value="" />
				<input type="hidden" class="uuid" name="uuid" value="${login.uuid}" />
				<input type="hidden" class="map_x" name="map_x" value="" />
				<input type="hidden" class="map_y" name="map_y" value="" />
			</tr>
				
		</tbody>
	</table>
	<button class="insert_btn" type="submit" value="regist" >글 등록</button>
	</form>
</div>
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div class="keyword-button">
					<form onsubmit="searchPlaces(); return false;">
						<input type="text" value="이태원 맛집" id="keyword" size="30">
						<button class="map_btn" type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
</body>

<script>
function InpuOnlyNumber(obj)
{
    if (event.keyCode >= 48 && event.keyCode <= 57) { //숫자키만 입력
        return true;
    } else {
        event.returnValue = false;
    }
}

</script>
<!-- 책 API 이용 -->
<script>
	function booksearch() {
		var keyword = $('.book').val();
		
				$.ajax({
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

<!-- 지도 API 이용 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c641b7de37b235b224307fbe383e582&libraries=services"></script>
<script>
	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});

	// 키워드로 장소를 검색합니다
	searchPlaces();

map.setDraggable(false); //맵 이동 금지    
map.setZoomable(false); //맵 드래그 금지

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
	$('.map_juso').text(juso); //input 창에 입력해주기
	$('.map_juso').val(juso)
	
	 var geocoder1 = new kakao.maps.services.Geocoder();
	 var callback = function(result, status) {
	     if (status === kakao.maps.services.Status.OK) {
	         $('.map_y').text(result[0].x);   //위도
	         $('.map_y').val(result[0].x)
	         $('.map_x').text(result[0].y);   //경도
	         $('.map_x').val(result[0].y);
	     }
	 };

	 geocoder1.addressSearch(juso, callback);
}
 

 


</script>
<!-- 파일 추가 -->
<script>
var count=0;
$(".appendimg").click(function(){	
	//3개 이상 5개 이하만 추가 할수 있다
	
	if(count<5){
		$('.newimg').append('<div class="fileappend"><input class="appendpic" type="file" name="img'+count+'"/><button type="button" class="del">삭제</button>');
		count++;
	}else{
		alert("최대 5까지 사진을 첨부할 수 있습니다!")
	}
	
	
});
</script>
<!-- 파일 업로드시 확장자 파일 종류 제한 -->
<script>
$(document).on("click",".del",function(){
	$(this).parent('.fileappend').remove();
	count--;
}); 
</script>


</html>