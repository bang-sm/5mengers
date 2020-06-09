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
<link rel="stylesheet" href="../resources/css/login.css">
<link rel="stylesheet" href="../resources/css/mypage.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="../resources/js/popup.js"></script>
<script src="../resources/js/hangle.js"></script>
</head>
<body>
<script>
	$(document).ready(function(){
		$("#serachBtn").click(function(){
			var bookname=$('#searchInput').val();
			location.href="/?bsr_name="+bookname+"";
		});
		autoSearchInit();
		var path=$(location).attr('pathname');
		var cookieName=path;
		console.log(cookieName);
		db_pop_check();
	    $("#po_btn_close").click(function () {
	    	//닫기 버튼을 클릭시 세션 부여 각페이지마다 다른 세션생성
	        setCookieMobile( cookieName, "done" , 1);
	        $("#popup_box").css("display","none");
	    });
	    function db_pop_check(){
	    	//페이지 마다 팝업창 체크하는 스크립트입니다.
	    		$.ajax({
	    		url: "/admin/popupCheck",
	    		type: "POST",
	    		success: function(data){
	    			for (var i = 0; i < data.length; i++) {
	    				
	    				//현재페이지에 팝업창이 있는지 체크
	    				if(data[i].np_page_name == path){
	    					//db에서 팝업창 활성화 된것이 있는 체크
	    					if(data[i].np_yes_no == 1){
	    						
	    						//페이지세션 확인
	    						if(document.cookie.indexOf(""+cookieName+"=done")<0){
	    							$("#popup_box").css("display","block");
	    							$("#np_title").text(data[i].np_title);
	    							$("#np_comment").text(data[i].np_comment);
	    							$(".pop-layer").draggable({
	    								containment: 'window'
	    							}); 
	    						}
	    						else{
	    							$("#popup_box").css("display","none");
	    						}
	    					}
	    				}
	    			}
	    		},
	    		error: function (request, status, error){       
	    			console.log(request,status,error);
	    		}
	    	});
	    }
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
                <Button id="po_btn_close" style="width: 190px" >오늘 하루동안 열지 않기</Button>
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
							<li>
								<input id="searchInput" type="text" style="width: 500px;height: 30px;margin-top: 9px;"/>
								<button id="serachBtn">검색</button>
							</li>
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
								<c:choose>
							         <c:when test = "${login.auth == 2}">
						          		<li>
											<button type="button" id="mypage" onclick="location.href='${contextPath}/admin/userlist'">관리자</button>
										</li>
										<li>
											<button type="button" id="logoutbtn">로그아웃</button>
										</li>
							         </c:when>
							         <c:when test = "${login.auth == 1}">
							         	<li>
											<button type="button" id="mypage" onclick="location.href='${contextPath}/my/nav'">마이페이지</button>
										</li>
										<li>
											<button type="button" id="logoutbtn">로그아웃</button>
										</li>		
							         </c:when>
							         <c:otherwise>
   										<li>
											<button type="button" id="logoutbtn" onclick="location.href='${contextPath}/user/login'">로그인</button>
										</li>	
							         </c:otherwise>
						      	</c:choose>
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