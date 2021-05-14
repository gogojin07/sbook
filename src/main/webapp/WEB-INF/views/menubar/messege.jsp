//메세지창

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/jquery.serializeObject.js"></script>
<script type="text/javascript">
/* function loadImage() {
	   console.log($('#profile'));
	   let file = $('#profile')[0].files[0]; //프사는 1개 
	   let maxSize=1024*1024; //1MB
	   if(file.size > maxSize) {
	      toastr.warning("사진은 1MB 이하여야 합니다", "경고");
	      $("#profile").val("");// 파일명 삭제
	      return false; //작업 실패
	   }
	   let reader = new FileReader();
	   reader.onload = function(e) {
	      console.log("e=", e);
	      $('#show_profile').attr('src', e.target.result);
	   }
	   reader.readAsDataURL(file); //서버아닌 PC에서 파일을 읽어오기 때문에 빠름
	   return true;
}
function printUser(){
	console.log("user=",user);
	$('#usernickname').val(user.usernickname);
	$('#birthDate').text(user.birthDate);
	$('#show_profile').attr("src",user.sajin);
	$('#profile').on("change",loadImage);
});

$(function(){
	$('#last_m').on('click', function(){
		$.ajax({
			url:
			method: ""
			data:
		})
	})
}); */
</script>
</head>
<body>
<div id="page">
	<header id="header">
	</header>
	<nav id="nav">
	</nav>
	<div id="main">
		<aside id="aside">
		</aside>
		<section id="section">
		<h3>내 친구</h3>
			<table "table table-hover" id="user2">
				<c:forEach var="message" items="${mList}">
					<tr id="profile_tr">
						<td rowspan="6">
						<img id="show_profile" height="200px;"><input type="file" name="profile" id="profile">
						</td>
					</tr>
					<tr> 
						<td align="center">${message.m_nickname}닉네임</td>
					</tr>
					<tr>
						<td id="last_m" align="center">${message.last_m}마지막 대화내용</td>
						<td align="center">${message.m_date}날짜</td>
					</tr>
				</c:forEach>
			</table>
			<div align="center">${paging}</div>
		</section>
		<hr>
		<section id="section">
		<h3>새로운 친구</h3>
			<table "table table-hover" id="user2">
				<c:forEach var="message" items="${mList}">
					<tr id="profile_tr">
						<td rowspan="6">
						<img id="show_profile" height="200px;"><input type="file" name="profile" id="profile">
						</td>
					</tr>
					<tr> 
						<td align="center">${message.m_nickname}닉네임</td>
					</tr>
					<tr>
						<td id="last_m" align="center">${message.last_m}마지막 대화내용</td>
						<td align="center">${message.m_date}날짜</td>
					</tr>
					<tr> 
						<td><input type="checkbox" name="req" value="true"></td>
					</tr>
				</c:forEach>
			</table>
			<div align="center">${paging}</div>
		</section>
	</div>