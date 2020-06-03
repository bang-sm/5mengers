<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
	<%@ include file="common/head.jsp"%>

	<div id="cate_box">
		<div id="cateline"
			style="position: relative; width: 1200px; margin-left: auto; margin-right: auto; top: 0px; z-index: 1000; left: 0px; background: rgb(255, 255, 255);">
			<div class="box_1200">
				<div id="category"
					class="xans-element- xans-layout xans-layout-category">
					<div class="position">
						<ul>
							<c:forEach var="list" items="${list}">
								<li class="xans-record-"><a href="" class='${list.bc_code}'>${list.bc_name}</a></li>
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
							<div class="box" class="${booklist.bsr_category}">
								<a href="${contextPath}/bookdetail?bsr_id=${booklist.bsr_id}&uuid=${booklist.uuid}&bsr_category=${booklist.bsr_category}">
									<img src="https://placeimg.com/270/250/any/grayscale" />
								</a> 
								<a href="${contextPath}/bookdetail?bsr_id=${booklist.bsr_id}&uuid=${booklist.uuid}&bsr_category=${booklist.bsr_category}">
									<span style="font-size: 12px; color: #000000;">
										<c:out value="${booklist.bsr_name }"/>
									</span>
									<br/>
									<strong class="title">
										<span style="font-size: 12px; color: #000000; font-weight: bold;">판매가</span>
										<span style="font-size: 12px; color: #000000; font-weight: bold;">
											<c:out value="${booklist.bsr_price }"/>
										</span>
									</strong>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>