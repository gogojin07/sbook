<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	console.log("${pList}");
</script>
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

	<table border="1">
		<c:forEach var="page" items="${pList}" >
			<form action="pagedelete" method="Post" >

				<tr>
					<td valign="top" width="900" height="300">
						<p style="font-size: 20;">
							<input type="hidden" name="pageNo" value=${page.pageNo}>
							<input type="button" onclick="articleView(${page.pageNo})" value="댓글">
							<fmt:formatDate pattern="yyyy-mm-dd" value="${page.p_date}" />
						</p> <br>${page.pagecontent}
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="삭제"></td>
				</tr>
				</form>
				<tr>
				
					<td><a href="index?frm=pageupdatefrm.jsp&themeNo=${theme.themeNo}&pageNo=${page.pageNo}" > <input type="submit" value="수정"> </a> </td>
				 
				</tr>
		</c:forEach>


		</form>
	</table>

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