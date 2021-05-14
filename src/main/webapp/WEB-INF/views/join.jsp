<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script type="text/javascript">
		$(function() { 
			$("#success").hide();
			$("#no").hide();
			$("#id_n").hide();
			$("#id_y").hide();
			$("input").keyup(function() {
				if ($("#pw").val() != "" || $("pw2").val() != "") {
					if ($("#pw").val() == $("#pw2").val()) {
						$("#success").show();
						$("#no").hide();
					} else {
						$("#success").hide();
						$("#no").show();
					}
				}
			})
		});
		$(document).ready(function() {
			// 취소
			$(".back").on("click", function() {
				location.href = "/home";
			})
			$("#submit").on("click", function() {
				if ($("#id").val() == "") {
					alert("아이디를 입력해주세요.");
					$("#user_id").focus();
					return false;
				}
				if ($("#pw").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#pw").focus();
					return false;
				}
				if ($("#pw2").val() == "") {
					alert("비밀번호를 확인해주세요.");
					$("#pw2").focus();
					return false;
				}
				if ($("#email").val() == "") {
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
				if ($("#emailaute").val() == "") {
					alert("인증번호를 입력하시오.");
					$("#emailaute").focus();
					return false;
				} 
				if ($("#nickname").val() == "") {
					alert("닉네임을 입력해주세요.");
					$("#nickname").focus();
					return false;
				}
				if ($("#birth").val() == "") {
					alert("생일을 입력해주세요.");
					$("#birth").focus();
					return false;
				}
				alert("회원가입 축하드려요.")
			});
		})
		function check() {
			id = $("#id").val();
			$.ajax({
				url : 'userjoin/userIdChk',
				type : 'get',
				dataType : 'text',
				contentType : 'text/plain; charset=utf-8;',
				data : {
					"id" : $('#id').val()
				},
				success : function(data) {
					if (data == 1) { 
						console.log("사용불가");
						$("#id_n").show();
						$("#id_y").hide();
						return 1;
					} else {
						console.log("사용가능");
						$("#id_y").show();
						$("#id_n").hide();
						return 0;
					}
					$('#temp').text(msg);
					$('#temp').css('color', color);
				},
				error : function() {

				}
			});
		}
	</script>
<style type="text/css">
	.p_css{
		position: absolute;
		top : 5%;
		left : 35%;
		transform : translate (-50%,-50%);
	} 
	.form-control{
	width: auto;
	}
</style>    
</head>
<body>
	<form action="userjoin" name="join" method="post" class="p_css" onsubmit="return check()">
		<table align="center">
			<tr>
				<td colspan="2" class="subject"><h2><label>회원가입</label></h2><br><br></td>
			</tr>
			<tr class=form-group>
				<td width="100">ID</td>
				<td><input type="text" id="id" name="id" class="form-control" placeholder="ID"><br></td>
				<td><div class="id_n" id="id_n">사용불가</div>
					<div class="id_y" id="id_y">사용가능</div></td>
				<td><input type="button" id="checkId" onclick="check()" class="btn btn-default btn-sm" value="중복검사">
					<div id="result"></div><br>
				</td>
			</tr> 
			<tr class=form-group>
				<td width="100">Password</td>
				<td><input type="password" id="pw" name="pw" class="form-control" placeholder="Password"></td>
				<td><div class="success" id="success">비밀번호 일치</div>
					<div class="no" id="no">비밀번호 불일치</div>
				</td>
			</tr>
			<tr class=form-group>
				<td width="100"></td>
				<td><input type="password" id="pw2" name="pwcheck"
					class="form-control" placeholder="Confirm Password"><br></td>
			</tr>
			<tr class=form-group>
				<td width="100">닉네임</td>
				<td><input type="text" id="nickname" name="nickname"
					class="form-control" placeholder="닉네임"><br></td>
			</tr>
			<tr class=form-group>
				<td width="100">생년월일</td>
				<td><input type="text" id="birth" name="birth"
					class="form-control" placeholder="생년월일"><br></td>
				<td>공개여부<input type="checkbox" name="birthopen"
						id="birthopen" value="option1" aria-label="...">
			</td>
			</tr>
	
			<tr class=form-group>
				<td width="100">E-mail</td>
				<td><input type="text" id="email" name="email"
					class="form-control" placeholder="E-mail"></td>
				<td>
					공개여부<input type="checkbox" name="emailopen"
						id="emailopen" value="option1" aria-label="..."><br></td>
			</tr>
			<tr class=form-group>
				<td><br><br></td>
			</tr>   
			<tr class=form-group>
			<td colspan="2" class="subject">
			<button type="submit" id="submit" class="btn btn-info">회원가입</button></td>
				<td><a href="./"><input type="button" class="btn btn-primary" value="로그인"></a></td>
			</tr>
			</table>
			<!-- <button type="submit" class="btn btn-primary" id="submit">회원가입</button> -->
			 	  
	</form>
</body>
</html>
