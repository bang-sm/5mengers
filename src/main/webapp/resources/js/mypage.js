//마이페이지용JS

function my_list(data,stat) {
	console.log(stat);
	if(stat=="S"){
		
		for (var i = 0; i < data.length; i++) {
	    	var confirm;
	    	var ok;
	    	if(data[i].bsr_confirm =='Y'){
	    		confirm="구매요청이 있습니다";
	    		ok="<button value='"+data[i].bsr_id+"'>수락하기</button>";
	    	}else{
	    		confirm="-";
	    		ok="";
	    	}
	    	var sellbox='<div class="card">'+
	    		'<div class="additional">'+
	    		'<div class="more-info">'+
	    		'<div class="stats">'+
	    		'<div>'+
	    		'<div class="value"></div>'+
	    		'</div><div>'+
	    		''+ok+'</div></div></div></div>'+
	    		'<div class="general">'+
	    		'<h1>'+data[i].bsr_name+'</h1>'+
	    		'<div class="" style="font-size:12px;color: red;text-align: center;">'+confirm+'</div>'+
	    		'<span class="more">'+
	    		''+data[i].bsr_price+'원'+
	    		'</span>';
	    		
	    	 $("#sell_book").append(sellbox);	
		}
	}
	else if(stat=="Z"){
		
		for (var i = 0; i < data.length; i++) {
	    	var confirm;
	    	var ok;
	    	console.log(data[i].bsr_check +" -----------------------------------");
	    	if(data[i].bsr_check==1){
	    		confirm="판매 되었습니다";
	    		ok="<button value='"+data[i].bsr_id+"'>목록제거</button>";
	    	}else{
	    		confirm="-";
	    		ok="";
	    	}
	    	var zzimbox='<div class="card">'+
	    		'<div class="additional">'+
	    		'<div class="more-info">'+
	    		'<div class="stats">'+
	    		'<div>'+
	    		'<div class="value"></div>'+
	    		'</div><div>'+
	    		''+ok+'</div></div></div></div>'+
	    		'<div class="general">'+
	    		'<h1>'+data[i].bsr_name+'</h1>'+
	    		'<div class="" style="font-size:12px;color: red;text-align: center;">'+confirm+'</div>'+
	    		'<span class="more">'+
	    		''+data[i].bsr_price+'원'+
	    		'</span>';
	    		
	    	 $("#zzim_book").append(zzimbox);	
		}
	}
};