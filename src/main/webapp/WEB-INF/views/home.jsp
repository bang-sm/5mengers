<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	autoSearchInit();
	$("#serachBtn").click(function(){
		var bookname=$('#searchInput').val();
		location.href="/?bsr_name="+bookname+"";
	});
	$(".box").slice(0, 8).show(); // 최초 10개 선택
		$("#load").click(function(e){ // Load More를 위한 클릭 이벤트e
		e.preventDefault();
		$(".box:hidden").slice(0, 8).show(); // 숨김 설정된 다음 10개를 선택하여 표시
		if($(".box:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
		alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
		}
	});
});
</script>
<body>
	<%@ include file="common/head.jsp"%>

	<div id="cate_box">
		<div id="cateline"
			style="position: relative; width: 1200px; margin-left: auto; margin-right: auto; top: 0px; z-index: 10; left: 0px; background: rgb(255, 255, 255);">
			<div class="box_1200">
				<div id="category"
					class="xans-element- xans-layout xans-layout-category">
					<div class="position">
						<ul>
							<c:forEach var="list" items="${list}">
								<li class="xans-record-">
									<a href="/?bc_code=${list.bc_code}" class='${list.bc_code}'>${list.bc_name}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="container">
		<div id="contents">
			<div class="xans-element- xans-product xans-product-listnormal">
				<div class="xans-element- xans-product xans-product-headcategory prolist_title ">
					5mengers <span>실시간 매물정보</span>
				</div>
				<ul class="prdList column4">
					<c:forEach var="booklist" items="${booklist}">
						<li id="" class="item xans-record-">
							<div class="box" class="${booklist.bsr_category}" style="display:none">
								<a href="${contextPath}/bookdetail?bsr_id=${booklist.bsr_id}&uuid=${booklist.uuid}&bsr_category=${booklist.bsr_category}">
									<img src="${contextPath}/bookimg/${booklist.img}" width="270px" height="250px"/>
								</a> 
								<a href="${contextPath}/bookdetail?bsr_id=${booklist.bsr_id}&uuid=${booklist.uuid}&bsr_category=${booklist.bsr_category}">
									<span style="font-size: 12px; color: #000000;">
										<c:out value="${booklist.bsr_name }"/>
									</span>
									<br/>
									<strong class="title">
										<span style="font-size: 12px; color: #000000; font-weight: bold;">판매가</span>
										<span style="font-size: 12px; color: #000000; font-weight: bold;">
											<c:out value="${booklist.bsr_price }"/>원
										</span>
									</strong>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
				<h1 id="load">더보기</h1>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
</body>
</html>