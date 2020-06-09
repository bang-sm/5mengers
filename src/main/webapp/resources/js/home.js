function autoSearchInit() {
	console.log("autoSearchInit호출됨");
	$.ajax({
		type : "GET",
		url : "/home/autoSerach",
		dataType : "json",
		success : function(data) {

			let source = $.map(data, function(item) { // json[i] 번째 에 있는게 item
				console.log(item);	
				chosung = "";
				Hangul.d(item, true).forEach(function(strItem, index) {
					if (strItem[0] != " ") { // 띄어 쓰기가 아니면
						chosung += strItem[0];// 초성 추가
					}
				});
				return {
					label : item, 
					value : item,
					chosung : chosung
				}
			});

			$("#searchInput").autocomplete({
				source : source, // source 는 자동 완성 대상
				select : function(event, ui) { // 아이템 선택시
				},
				focus : function(event, ui) { // 포커스 가면
					return false;// 한글 에러 잡기용도로 사용됨
				}
			})
		}
	});
};