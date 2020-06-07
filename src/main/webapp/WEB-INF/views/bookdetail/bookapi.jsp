네네<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
table{
width:600px;
}

th,td {
width:150px;
  padding: 5px;
}

#booklist_ul {
	margin: 0px;
	padding: 0px;
	width: 600px;
	height: 500px;
}

.booklist_li {
	list-style: none;
	margin: 20px 0 0 20px;
	width: 600px;
	height: 600px;
}

#booklist {
	width: 600px;
	overflow: hidden;
	position: absolute;
	top: 100px;
	right: 300px;
}
.booklist_img{
 width:100%;
 height:auto;
}
#booklist_div {
	overflow-y: scroll;
	width: 700px;
	height: 800px;
	background-color: white;
}
</style>
</head>
<body>
<input class="book"type="text" name="title" value="책 이름 "/>
<button class="bookbtn" onclick="btnqwer()">책 검색</button>
	<div id="booklist">
		<div id="booklist_div">
			<ul id="booklist_ul">
			<table id ="bookajax"></table>
			</ul>
		</div>
	</div>
	

</body>

<script>
function btnqwer(){
	var keyword = $('.book').val();
	alert("keyword : "+keyword);
	 $.ajax({
         url: "/bookapicheck", //매핑
         type: "GET",
         data :  {
        	 "keyword" : keyword
         },
         success : function(data){
        	 var total = data.items.length;
             console.log("total : "+total);
             var info ="<tr><th>이미지</th><th>제목</th><th>저자</th><th>정가</th>"
            // "책 제목 : "+jemok +"<br>가격 : "+price +"<br>저자 : "+author +"사진 : "+"<img src='"+image+"'/>";
            for(var i=0;i<total;i++){
            	info +="<li class='booklist_li'><tr>";
            	info+="<td><img class='booklist_img' src='"+data.items[i].image+"'/></td>";
            	info+="<td>"+data.items[i].title+"</td>";
            	info+="<td>"+data.items[i].author+"</td>";
            	info+="<td>"+data.items[i].price+"</td>";
            	info+="</tr></li>";
            }
            
            $('#bookajax').html(info);
            
         }, 
         error : function(){
        	 
         }
      });
}
</script>
</html>