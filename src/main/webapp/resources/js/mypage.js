//마이페이지용JS

function sellList(data) {
	console.log("myjs에서 호출된 로그");
    console.log(data);
    
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
    	var cardbox='<div class="card">'+
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
    		
    	 $("#sell_book").append(cardbox);	
	}
};

//$("#sell_book").append('<div class="card">');
//$("#sell_book").append('<div class="additional">');
//$("#sell_book").append('<div class="more-info">');
//$("#sell_book").append('<div class="stats">');
//$("#sell_book").append('<div>');
//$("#sell_book").append('<img src="https://cdn0.iconfinder.com/data/icons/shopping-icons-5/100/Heart-512.png" width="50" height="50"/>');
//$("#sell_book").append('<div class="value">2</div>');
//$("#sell_book").append('</div>');
//$("#sell_book").append('<div>');
//$("#sell_book").append('<button>수락하기</button>');
//$("#sell_book").append('</div>');
//$("#sell_book").append('</div>');
//$("#sell_book").append('</div>');
//$("#sell_book").append('</div>');
//$("#sell_book").append('<div class="general">');
//$("#sell_book").append('<h1>책제목</h1>');
//$("#sell_book").append('<div class="" style="font-size:12px;color: red;text-align: center;">구매요청이 있습니다.</div>');
//$("#sell_book").append('<span class="more">');
//$("#sell_book").append('채가격');
//$("#sell_book").append('</span>');