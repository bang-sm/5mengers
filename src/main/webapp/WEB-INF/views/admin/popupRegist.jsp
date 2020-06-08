<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.textCenter td{
	text-align: center;
}
</style>
<script>
	$(document).ready(function(){
		
		//팝업 삭제하기
		$('.del_popup').click(function(){
			var btn_np_id=$(this).val();
			$.ajax({
    			url: '/admin/popup_delete',
    			type: "GET",
    			data:{
    				"np_id" :  btn_np_id
    			},
    			success: function(data){
    				alert(data);
    			},
    			error: function (request, status, error){      
    				console.log(request,status,error);
    			}
    	  	});
		});
		//팝업창 상태 온오프 변경하기
	    $(".popup_status").change(function(){
	        if($(this).is(":checked")){
	        	$(this).val("1");
	            
	            var np_id=$(this).parent().prevAll().children('.np_id').val();
	            var np_title=$(this).parent().prevAll().children('.np_title').text();
	            var np_page_name=$(this).parent().prevAll().children('.np_page_name').text();
	            var np_yes_no=$(this).val();
	            $.ajax({
	    			url: '/admin/popup_status_update',
	    			type: "POST",
	    			data:{
	    		 		"np_yes_no" : np_yes_no,
	    				"np_id" :  np_id,
	    				"np_page_name" :  np_page_name,
	    				"np_title" :  np_title
 	    			},
	    			success: function(data){
	    				alert(data);
	    			},
	    			error: function (request, status, error){      
	    				console.log(request,status,error);
	    			}
	    	  	});
	        }else{
	        	$(this).val("0");
        	 	var np_yes_no=$(this).val();
        	 	var np_id=$(this).parent().prevAll().children('.np_id').val();
	            var np_title=$(this).parent().prevAll().children('.np_title').text();
	            var np_page_name=$(this).parent().prevAll().children('.np_page_name').text();
	        	$.ajax({
	    			url: '/admin/popup_status_update',
	    			type: "POST",
	    			data:{
	    		 		"np_yes_no" : np_yes_no,
	    				"np_id" :  np_id,
	    				"np_page_name" :  np_page_name,
	    				"np_title" :  np_title
 	    			},
	    			success: function(data){
	    				alert("팝업등록 상태변경완료 : 해제");
	    			},
	    			error: function (request, status, error){      
	    				alert("실패...");
	    			}
	    	  	});
	        }
	    });
	});
</script>
<body>
	<%@ include file="../common/head.jsp"%>
	<%@ include file="../common/adminSideMenu.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="boardList">
				<table border="1" summary="">
					<thead class="">
						<tr style="">
							<th scope="col" width="30%">팝업제목</th>
							<th scope="col" width="50%">팝업페이지</th>
							<th scope="col" width="10%">표출여부</th>
							<th scope="col" width="10%">삭제</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${popupList}" var="popupList">
						<tr style="color: #555555;" class="textCenter">
							<td class="">
								<input class="np_id" type="hidden" name="np_id" value='${popupList.np_id}'/>
								<a href="#" class="np_title" >${popupList.np_title}</a>
							</td>
							<td class="">
								<a href="#" class="np_page_name">${popupList.np_page_name}</a>
							</td>
							<td class="">
								<c:if test="${popupList.np_yes_no eq 1}">
									<input type="checkbox" checked="checked" class="popup_status" name="popup_status" value="${popupList.np_yes_no}"/>
								</c:if>
								<c:if test="${popupList.np_yes_no eq 0}">
									<input type="checkbox" class="popup_status" name="popup_status" value="${popupList.np_yes_no}"/>
								</c:if>
							</td>
							<td class="">
								<button class="del_popup" value="${popupList.np_id}">삭제</button>
							</td>
						</tr>
					</c:forEach>
						
					</tbody>
				</table>
			</div>
			<a href="${contextPath}/admin/popupWrite">새로운 팝업창 등록하기</a>
		</div>
	</div>

</body>
</html>