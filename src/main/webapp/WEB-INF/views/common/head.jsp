<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="http://localhost:8080"></c:set>
<%-- <c:set var="contextPath" value="http://gksfk6165.cafe24.com"></c:set> --%>
<%-- 프로젝트용 / 로컬용 패스--%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/card.css">
<link rel="stylesheet" href="../resources/css/mypage.css">
<link rel="stylesheet" href="../resources/css/login.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
<script src="../resources/js/popup.js"></script>

</head>

<body>
<script>
	$(document).ready(function(){
		App.TopPop.init();
		
		//현재페이지
		console.log($(location).attr('pathname'));
		var path=$(location).attr('pathname');
		//페이지 마다 팝업창 체크하는 스크립트입니다.
 		$.ajax({
			url: "/admin/popupCheck",
			type: "POST",
			success: function(data){
				for (var i = 0; i < data.length; i++) {
					console.log(data[i].np_id);
					console.log(data[i].np_page_name);
					if(data[i].np_page_name == path){
						if(data[i].np_yes_no == 1){
							$("#popup_box").css("display","block");
							$("#np_title").text(data[i].np_title);
							$("#np_comment").text(data[i].np_comment);
							$(".pop-layer").draggable({
								containment: 'window'
							});
						}
					}
				}
			},
			error: function (request, status, error){       
				console.log(request,status,error);
			}
		});
	});
</script>
<body>
	<!-- 레이어 팝업창 용도입니다. -->
	<div id="popup_box" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
				<div id="np_title"></div>
				<span id="np_comment"></span>
			</div>
			 <div class="btn-r">
                <Button id="po_btn_close" >Close</Button>
            </div>
		</div>
	</div>
	
	<div id="header_top">
		<div id="header">
			<div id="topbar">
				<div class="box_1200">
					<div class="topbar_left">
						<ul>
							<li><a href="${contextPath}/admin/userlist">구매요청게시판</a></li>
							<li><a
								href="${contextPath}/booksellregist/booksellregistPage">나의책등록</a></li>
						</ul>
					</div>
					<div class="topbar_right">
						<ul>
							<c:if test="${ empty login }">
								<li>
									<button type="button" id="login" onclick="location.href='${contextPath}/user/login'">로그인</button>
								</li>
							</c:if>
							<c:if test="${not empty login }">
								<li>
									<button type="button" id="mypage" onclick="location.href='${contextPath}/my/nav'">마이페이지</button>
								</li>
								<li>
									<button type="button" id="logoutbtn">로그아웃</button>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<div id="logo">
				<a href="/"
					style="font-size: 150px; font-weight: 700; color: #000; text-decoration: none">5MEN</a>
			</div>

		</div>
	</div>
</body>
<script type="text/javascript">
	$('#logoutbtn').on('click', function(){
		$.ajax({
			url : "../user/logout",
			type: "GET",
			success: function(){
				alert('로그아웃 되었습니다.');
				location.reload();
			}, error: function(){
				alert('다시 시도해 주세요!');
			}
		})
	});
</script>
</html>