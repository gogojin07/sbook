<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	console.log(${pList});
</script>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0
}
#articleView_layer {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}
#articleView_layer.open {
	display: block;
	color: red;
}
#articleView_layer #bg_layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
	z-index: 100
}
#contents_layer {
	position: absolute;
	top: 40%;
	left: 40%;
	width: 400px;
	height: 400px;
	margin: -150px 0 0 -194px;
	padding: 28px 28px 0 28px;
	border: 2px solid #555;
	background: #fff;
	font-size: 12px;
	z-index: 200;
	color: #767676;
	line-height: normal;
	white-space: normal;
	overflow: scroll
}
</style>
</head>
<body>
<form action="pageview" name="pageview" method="get">
		<table border="1">
			<c:forEach var="page" items="${pList}">
			<tr> </tr>
			<td width="900"; height="300">	${page.p_date} <br>${page.pagecontent} <br> <br>
			<a href="#" onclick="articleView(${page.pageNo})">댓글</a></td>
			
			</c:forEach>
		</table>
	</form>
	
		<!-- 모달(Modal) 박스 -->
	<div id="articleView_layer">
		<div id="bg_layer"></div>
		<div id="contents_layer">  </div>
	</div>

</body>
<script type="text/javascript">
 function articleView(num){
	$("#articleView_layer").addClass('open');
	
	$.ajax({
		type:'get',
		url: 'content',
		data: {pageNo: num},
		dataType: 'html' //ajaxContents.jsp에 상세 내용을 출력후 리턴 
	}).done((data)=>$('#contents_layer').html(data))
	.fail((err)=>console.log(err)); //ajax End
} 

$(function(){
	const $window=$("#articleView_layer");
	$window.find("#bg_layer").on('mousedown',function(evt){
		console.log(evt);
		$window.removeClass('open');
	})
	//esc 키 눌러 모달창 닫기
	$(document).keydown(function(evt){
		console.log(evt);
		if(evt.keyCode!=27) return;
		else if($window.hasClass('open')){
			$window.removeClass('open');
		}
	});//keydown End
}); //ready end
</script>
</html>