<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<script type="text/javascript" src="../resources/js/mypage.js"></script>
</head>

<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="title_top">
				<h2>
					MY PAGE <span class="title_sub">${login.name } 님의  판매중인 책</span>
				</h2>
			</div>
			<div class="mypage_banner">
				<div>
					<a href="http://localhost:8080/my/boardList">구매요청 리스트</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/qnaList">나의QnA 리스트</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/sellbook">판매중인책</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/buybook">구매중인책</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/zzim">찜목록</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/buycomplete">구매내역리스트</a>
				</div>
				<div>
					<a href="http://localhost:8080/my/manyask">자주묻는질문</a>
				</div>
			</div>
			<div id="myStatus">
				<div class="myStatus_box" id="sell_book">
				</div>
				<div class="myStatus_box"></div>
				<div class="myStatus_box"></div>
			</div>
			<script>
				$(document).ready(function(){
					$.ajax({
				  			url: '/my/sellbook',
				  			type: "GET",
				  			success: function(data){
				  				sellList(data);
				  			},
				  			error: function (request, status, error){      
				  			}
				  	  	});
				});
			</script>
		</div>
	</div>
</body>
</html>

