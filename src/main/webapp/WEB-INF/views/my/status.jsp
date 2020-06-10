<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
			<div id="myStatus">
				<div class="myStatus_box" id="sell_book"></div>
				<div class="myStatus_box" id="zzim_book"></div>
				<div class="myStatus_box" id="request_book"></div>
			</div>
			<script>
				$(document).ready(function(){
					goAjax();
					setInterval(goAjax, 30000);
				});
			</script>
		</div>
	</div>
</body>
</html>

