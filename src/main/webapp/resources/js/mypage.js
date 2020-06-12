//마이페이지용JS


function my_list(data,stat) {
	//console.log(stat);
	if(stat=="S"){	
		$("#sell_book").empty();
		for (var i = 0; i < data.length; i++) {
	    	var confirm;
	    	var ok;
	    	var st;
	    	if(data[i].bsr_check ==0){
	    		confirm="구매요청옴";
	    		ok="<button type='button' class='confirm' value='"+data[i].bsr_id+"'>수락하기</button>";
	    	}else{
	    		confirm="-";
	    		ok="";
	    	}
	    	if(data[i].bsr_check ==3){
	    		if(data[i].bsr_status ==1){
		    		st="<button type='button' class='st_off' style='background:red' value='"+data[i].bsr_id+"'>활성화중</button>";
		    	}else{
		    		st="<button type='button' class='st_on' value='"+data[i].bsr_id+"'>비활성화중</button>";
		    	}
		    	var sellbox='<div class="card">'+
		    		'<div class="more-info">'+
		    		'<div class="stats">'+
		    		'<div>'+
		    		'<div class="value"></div>'+
		    		'<div>'+
		    		''+ok+'</div>'+st+'</div></div></div>'+
		    		'<div class="general">'+
		    		'<a href="/bookdetail?bsr_id='+data[i].bsr_id+'&uuid='+data[i].uuid+'&bsr_category='+data[i].bsr_category+'" class="book_title">'+data[i].bsr_name+'</a>'+
		    		'<div class="" style="font-size:30px;font-weight:bold;color: red;text-align: center;">'+confirm+'</div>'+
		    		'<span class="more">'+
		    		''+data[i].bsr_price+'원'+
		    		'</span>';
		    	 $("#sell_book").append(sellbox);	
	    	}
	    	
		}
		$(".confirm").on("click",function(){
			location.href="/my/confirm?bsr_id="+$(this).val()+"";
		});
		$(".st_off").on("click",function(){
			console.log("클릭중");
			location.href="/my/bookstatus?bsr_status=0&bsr_id="+$(this).val()+"";
		});
		$(".st_on").on("click",function(){
			location.href="/my/bookstatus?bsr_status=1&bsr_id="+$(this).val()+"";
		});
	}
	else if(stat=="Z"){
		var path="\/my\/zzimDelete";
		$("#zzim_book").empty();	
		for (var i = 0; i < data.length; i++) {
	    	var confirm;
	    	console.log(data[i].bsr_check +" -----------------------------------");
	    	if(data[i].bsr_check==1){
	    		confirm="판매완료";
	    	}else{
	    		confirm="-";
	    	}
	    	var zzimbox='<div class="card">'+
	    		'<div class="more-info">'+
	    		'<div class="stats">'+
	    		'<div>'+
	    		'<div class="value"></div>'+
	    		'</div><div><button type="button" class="zzimDelete" value="'+data[i].bsr_id+'">찜해제</button>'+
	    		''+ok+'</div></div></div>'+
	    		'<div class="general">'+
	    		'<a href="/bookdetail?bsr_id='+data[i].bsr_id+'&uuid='+data[i].uuid+'&bsr_category='+data[i].bsr_category+'" class="book_title">'+data[i].bsr_name+'</a>'+
	    		'<div class="" style="font-size:30px;font-weight:bold;color: red;text-align: center;">'+confirm+'</div>'+
	    		'<span class="more">'+
	    		''+data[i].bsr_price+'원'+
	    		'</span>';
	    		
	    	 $("#zzim_book").append(zzimbox);	
		}
		
		$(".zzimDelete").on("click",function(){
			location.href="/my/zzimDelete?bsr_id="+$(this).val()+"";
		});
	}
	else if(stat=="R"){
		$("#request_book").empty();	
		for (var i = 0; i < data.length; i++) {
	    	var confirm;
	    	var ok;
	    	console.log(data[i].bsr_check +" -----------------------------------");
	    	if(data[i].bsr_confirm=="Z"){
	    		confirm="수락대기중";
	    		ok="<button value='"+data[i].bsr_id+"'>수락대기중</button>";
	    	}else{
	    		confirm="-";
	    		ok="";
	    	}
	    	
	    	var request_book='<div class="card">'+
	    		'<div class="more-info">'+
	    		'<div class="stats">'+
	    		'<div>'+
	    		'<div class="value"></div>'+
	    		'<div>'+
	    		''+ok+'</div></div></div></div>'+
	    		'<div class="general">'+
	    		'<a href="/bookdetail?bsr_id='+data[i].bsr_id+'&uuid='+data[i].uuid+'&bsr_category='+data[i].bsr_category+'" class="book_title">'+data[i].bsr_name+'</a>'+
	    		'<div class="" style="font-size:30px;font-weight:bold;color: red;text-align: center;">'+confirm+'</div>'+
	    		'<span class="more">'+
	    		''+data[i].bsr_price+'원'+
	    		'</span>';
	    		
	    	 $("#request_book").append(request_book);	
		}
	}
};
function goAjax(){
	var stat;
	//판매중 리스트
	stat="S";
	$.ajax({
			url: '/my/statusList',
			type: "GET",
			data:{
				"stat" : stat
			},
			success: function(data){
				//console.log(data);
				stat="S";
				my_list(data,stat);
			},
			error: function (request, status, error){      
			}
	  	});

	//찜 리스트
	stat="Z";
	$.ajax({
			url: '/my/statusList',
			type: "GET",
			data:{
				"stat" : stat
			},
			success: function(data){
				//console.log(data)
				stat="Z";
				my_list(data,stat);
			},
			error: function (request, status, error){      
			}
	  	});
	//구매요청리스트
	stat="R";
	$.ajax({
			url: '/my/statusList',
			type: "GET",
			data:{
				"stat" : stat
			},
			success: function(data){
				//console.log(data)
				stat="R";
				my_list(data,stat);
			},
			error: function (request, status, error){      
			}
	  	});
}

$(document).ready(function(){
    
    $("#Start_DatePicker").datepicker({
		changeMonth: true, 
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
        changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    });
    $("#End_DatePicker").datepicker({
		changeMonth: true, 
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yy-mm-dd",
        changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    });

	$(".dataSearch").click(function(){
		console.log("누르눈중");
		var startDate=$("#Start_DatePicker").val();
		var endDate=$("#End_DatePicker").val();
		console.log(startDate,endDate);
  		location.href="/my/buycomplete?startDate="+startDate+"&endDate="+endDate;
	});
	
	$(".selldataSearch").click(function(){
		console.log("누르눈중");
		var startDate=$("#Start_DatePicker").val();
		var endDate=$("#End_DatePicker").val();
		console.log(startDate,endDate);
  		location.href="/my/sellHistory?startDate="+startDate+"&endDate="+endDate;
	});

});


