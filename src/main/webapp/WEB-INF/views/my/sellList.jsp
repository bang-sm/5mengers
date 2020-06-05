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
				<div class="myStatus_box" id="sell_book"></div>
				<div class="myStatus_box" id="zzim_book"></div>
				<div class="myStatus_box"></div>
			</div>
			<script>
				$(document).ready(function(){
					
					var stat;
					//판매중 리스트
					stat="S";
					$.ajax({
					
				  			url: '/my/sellbook',
				  			type: "GET",
				  			data:{
				  				"stat" : stat
				  			},
				  			success: function(data){
				  				console.log("판매중 리스트리턴 성공")
				  				console.log(data);
				  				stat="S";
				  				my_list(data,stat);
				  			},
				  			error: function (request, status, error){      
				  			}
				  	  	});
			
					//찜 리스트
					stat="Z";
					$.ajax({
					
			  			url: '/my/sellbook',
			  			type: "GET",
			  			data:{
			  				"stat" : stat
			  			},
			  			success: function(data){
			  				console.log("찜 리스트리턴 성공");
			  				console.log(data)
		  					stat="Z";
			  				my_list(data,stat);
			  			},
			  			error: function (request, status, error){      
			  			}
			  	  	});
					
					//구매요청중리스트
				});
			</script>
		</div>
	</div>
</body>
</html>

