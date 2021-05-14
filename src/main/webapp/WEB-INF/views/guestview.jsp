<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
		<table>
			<tr>
				<td rowspan="4">${profile}<td>id</td><td>${id}</td>
			</tr>
			<tr>
			<td>이메일</td><td>${email}</td>
			</tr>
			<tr>
			<td>생일</td><td>${birth}</td>
			</tr>
			<tr>
			<td>닉네임</td><td>${nickname}</td>
			</tr>
			<tr><td colspan="2">
				<a href=index?frm=myinfoupdatefrm.jsp>수정하기</a>
			</td></tr>
		</table>
	</form>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</html>
