<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="http://localhost:8080/"></c:set>  
<%-- <c:set var="contextPath" value="http://gksfk6165.cafe24.com/"></c:set>   --%>
<%-- 프로젝트용 / 로컬용 패스--%>
<html>
<head>
<title>Home</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/mypage.css">
</head>
<body>
	<div id="header_top">
		<div id="header">
			<div id="topbar">
				<div class="box_1200">
					<div class="topbar_left">
						<ul>
							<li><a href="${contextPath}/admin/userlist">구매요청게시판</a></li>
							<li><a href="${contextPath}/booksellregist/booksellregistPage">나의책등록</a></li>
						</ul>
					</div>
					<div class="topbar_right">
						<ul>
							<li><a href="${contextPath}/my/nav">마이페이지</a>
							<li><a href="${contextPath}/user/login">로그인</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="logo">
				<a href="/" style="font-size:150px;font-weight: 700;color: #000;text-decoration: none">5MEN</a>
			</div>
			
		</div>
	</div>
</body>
</html>