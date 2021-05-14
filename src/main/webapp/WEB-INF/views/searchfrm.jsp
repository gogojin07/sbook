<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<table>

		<c:forEach var="user" items="${uList}">
			<tr>
				<td rowspan="3"><a href="index?frm=themesearchlist.jsp&id=${user.id}">${user.profile}</a></td>
				<td align="center" class="font">${user.id}</td>
			</tr>
			<tr>
				<td>${user.nickname}</td>
			</tr>
			<tr>
				<td>${user.email}</td>
			</tr>


		</c:forEach>

	</table>
	</form>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</html>
