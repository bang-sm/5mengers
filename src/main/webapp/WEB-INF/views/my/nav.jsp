<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
</head>
<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<%@ include file="../common/myNav.jsp"%>
			<!-- .mypage_banner -->
			<div class="xans-element- xans-myshop xans-myshop-bankbook">
				<ul>
					<li class="first">
						<strong class="title">판매중인 책</strong> 
						<strong class="data use">
							<c:out value="${sellingbook}"/>개
						</strong> 
						<a href="/my/status">조회</a>
					</li>
					<li class="">
						<strong class="title">구매중인 책</strong>
					 	<strong class="data">
					 		<c:out value="${buyingbook}"/>개
					 	</strong>
					 	<a href="/my/status">조회</a>
				 	</li>
					<li class="">
						<strong class="title">찜 중인 책</strong>
					 	<strong class="data">
					 		<c:out value="${zzim}"/>개
					 	</strong>
					 	<a href="/my/status">조회</a>
				 	</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>