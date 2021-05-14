<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*" %>
<% String sql = "select *from theme"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<h2>방명록</h2>
	<form action="glist" method="get">
		<table width="300" height="100" >
		<tr>
			<td align="center"><a href="index?frm=Guestwrite.jsp"><button type="button">글쓰기</button></a></td>
		</tr>
		<tr>
		<td>
			<c:forEach var="guest" items="${gList}">
				<br><br>${guest.g_date} <br>${guest.guestcontent} <br>${guest.nickname}
			</c:forEach> <br></td>
		</tr>
		
		
		</table>
	</form>

</body>
</html>