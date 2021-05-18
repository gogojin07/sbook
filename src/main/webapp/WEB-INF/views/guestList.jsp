<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%
	String sql = "select *from theme";
%>
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

	<table width="300" height="100">
		<form action="glist" method="get">
			<tr>
				<td align="center"><a
					href="index?frm=Guestwrite.jsp&guestno=${gb.guestno}"><button
							type="button">글쓰기</button></a></td>
			</tr>
		</form>

		<c:forEach var="guest" items="${gList}">
			<tr>
				<td><br> <br>${guest.g_date} <br>${guest.guestcontent}
					<br>${guest.nickname}</td>
			</tr>
			<form method="post" action="guestwritedelete">
			<tr>
				
				<td><input type="hidden" name="id" value="${guest.id}">
					<input type="hidden" name="gbnumber" value="${guest.gbnumber}">
					<input type="submit" value="삭제"></td>


			</tr>
			</form>
		
			<tr>

				<td>
				<input type="hidden" name="id" value="${guest.id}">
				<a href="index?frm=guestwriteupdate.jsp&gbnumber=${guest.gbnumber}&id=${guest.id}">
						<input type="submit" value="수정">
				</a></td>

			</tr>
			
		</c:forEach>
		<br>


	</table>



</body>
</html>