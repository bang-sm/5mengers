


// 책 API 받아오기
function booksearch() {
      var keyword = $('.book').val();
      
            $.ajax({
               url : "/booksellregistajax", // controller에서 받는다
               type : "GET",
               data : {
                  "keyword" : keyword
               },
               success : function(data) {
                  var total = data.items.length;
                  console.log("total : " + total);
                  var info = "<tr class = 'trtop'><th>이미지</th><th>제목</th><th>저자</th><th>정가</th>"
                  for (var i = 0; i < total; i++) {
                     var title = data.items[i].title;
                     title
                           .replace(
                                 /<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig,
                                 "");
                     info += "<tr class='booktr'>";
                     info += "<td><img class='booklist_img' src='"+data.items[i].image+"'/></td>";
                     info += "<td class = 'searchTitle'> "
                           + data.items[i].title + "</td>";
                     info += "<td class='author'>"
                           + data.items[i].author + "</td>";
                     info += "<td class = 'price'>"
                           + data.items[i].price + "원" + "</td>";
                     info += "</tr>";
                  }
                  $('#bookajax').html(info);
                  $("#booklist").show();
                  $("#booklist").draggable({
                  cursor:"pointer",
                  containment: 'window'
               });
               },
               error : function() {

               }
            });
   }
  
// 유효성 검사 
function check(){
   var imgnum=0;
   var undefinenum=0;
   if ($("#booktitle").val() == ""){
      alert("책을 검색해주세요")
      $("#booktitle").focus();
      return false;
   }
   
   if ($("#bsr_category").val() == ""){
      alert("책 카테고리를 확인해주세요")
      return false;
   }
   
   if ($("#price").val() == ""){
      alert("희망 가격을 입력해주세요")
      $("#price").focus();
      return false;
   }
   
   if ($("#place").val() == ""){
      alert("거래 위치를 선택해 주세요")
      return false;
   }
   
   if ($("#content").val() == ""){
      alert("책 소개글을 입력해주세요")
      $("#content").focus();
      return false;
   }
   
   var imgcount = $('.appendpic').length; //인풋의 개수
   for(i=0;i<imgcount;i++){
      if($("input[name=img"+i+"]").val() =="" ){
          undefinenum++;
      }else{
         imgnum++;
      }
      if(!($("input[name=img"+i+"]").val().match(reg)) ){
         alert("업로드한 파일은 이미지 파일이 아닙니다")
         return false;
      }
   } 
   if(imgnum<3 || imgnum >5 || undefinenum !=0){
      alert("사진은 3장부터 5장까지 첨부 하셔야 합니다!");
      return false;
   }
   var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
   
   
   if(!($(".appendpic").val().match(reg)) ){
      alert("업로드한 파일은 이미지 파일이 아닙니다")
      return false;
   }
   
   alert("책 등록에 성공하셨습니다.");
   
   
   return true
   
}


