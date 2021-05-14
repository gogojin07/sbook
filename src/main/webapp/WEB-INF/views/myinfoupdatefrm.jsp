<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<form action="myinfoupdate" name="myinfoupdatefrm" method="post"
		onsubmit="return check()">
		<table>
			<tr>
				<td rowspan="4">${profile}</td>

				<td>id</td>
				<td><input type="hidden" name="id" value="${id}">${id}</td>
			</tr>
			<tr>
				<td><input type="hidden" name="email" value="${email}">이메일</td>
				<td>${email}</td>
				<td><input type="checkbox" id="emailopen" name="emailopen"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="birth" value="${birth}">생일</td>
				<td>${birth}</td>
				<td><input type="checkbox" id="birthopen" name="birthopen"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type=text name="nickname" value="${nickname}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"
					onclick="javascript: form.action='myinfoupdate';"> <input
					type="submit" value="회원탈퇴"
					onclick="javascript: form.action='myinfodelete';"> <a
					href="/sb/index?frm=myinfo.jsp">돌아가기</a></td>
			</tr>
		</table>
	</form>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</html>
