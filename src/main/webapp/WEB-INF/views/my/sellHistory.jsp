<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매히스토리</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

</head>
<body>
	<%@ include file="../common/head.jsp"%>
	<div id="container">
		<div id="contents">
			<%@ include file="../common/myNav.jsp"%>
			<div style="float: right;">
				<input type="text" id="Start_DatePicker" style="border:1px solid #000;"/>
				<input type="text" id="End_DatePicker" style="border:1px solid #000"/>
				<div class="button_base double_roll selldataSearch">
			        <div>검색</div>
			        <div>검색</div>
			        <div>검색</div>
			        <div>검색</div>
   				</div>
				<div style="width: 150px;height: 30px;float: left;">기간을 선택해주세요</div>
			    
			</div>
			<div class="boardList">
				<table border="1" summary="">
					<thead class="">
						<tr style="">
							<th scope="col" style="width: 70px;">NO.</th>
							<th scope="col" style="width: auto;">책제목</th>
							<th scope="col" style="width: 100px;">판매했던가격</th>
							<th scope="col" style="width:200px;" class="">판매날짜</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${fn:length(list) eq 0}">
							<tr style="color: #555555;">
								<td class="text_center" colspan="5">판매내역이 없습니다 기간을 선택해주세요.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="list" varStatus="i">
								<tr style="color: #555555;">
									<td class="text_center">${i.count}</td>
									<td class="text_center">
										<a href="#">${list.bsr_name}</a> 
									</td>
									<td class="text_center">${list.bsr_price }</td>
									<td class="text_center">${list.bsr_regdate }</td>
								</tr>
							</c:forEach>
						</c:otherwise>				
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
	window.onload = function() {
		initdate();
	    alert("여러 코드 가능!");
	}
</script>
</html>
