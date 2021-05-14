<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
   
<style type="text/css">
	.p_css{
		position: absolute;
		top : 20%; 
		left : 30%; 
		transform : translate (-50%,-50%);
	}
	.form-control{
		height: 50px;
	}
	#log{
		height : 40px;  
		width : 350px;
	}
	#ww{
		margin-top: -0.05px;
	}

</style>
<!-- <script type="text/javascript"> 
	$(function(){
		$("#log").on("click", function(){
			var param = {
					id : $("#id").val(),
					pw : $("#pw").val()
			}
			$.ajax({
				url : "/sbook/access",
				data : param,
				method : "post"
			})
		});
	}) 

</script> -->
</head>
<body>
<form action="access?frm=menubar/themelist.jsp" method="post" align="center">
	<table class="p_css">
	
		<tr>
			<td><h2><label>로그인</label></h2></td> 
		</tr>
		<tr>
			<td width="60%"><input type="text" id="id" name="id" class="form-control" placeholder="ID"><br></td>
		<tr>
			<td width="60%"><input type="password" id="pw" name="pw" class="form-control" placeholder="Password"><br></td>
		</tr>
		<tr>	
			<td colspan="2" align="center" width="50%"><button type="submit" class="btn btn-primary" id="log"><h4 id="ww">로그인</h4></button></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><a href="./join">회원가입&nbspㅣ&nbsp</a><a href="./idfind">아이디찾기&nbspㅣ&nbsp</a><a href="./pwfind">비밀번호찾기</td>
		</tr> 
		<tr>	
		</tr>
	</table>
	

	
	<div id="ajax2"></div> <!--//붙여넣을 위치 //-->
<a href="#" onclick="ajax_load_contents('/join.jsp','ajax2');return false;" class="button default">html 파일 내용 삽입하기</a>
</form>

</body>
</html>
