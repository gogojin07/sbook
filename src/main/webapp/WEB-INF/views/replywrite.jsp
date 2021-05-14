<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<form id="rFrm" name="rFrm" action="replyInsert" method="post">
		<h2>댓글작성이지롱</h2>
		<table>
			<tr>


			</tr>
			<tr>
				<td><input type="hidden" name="pageNo" value="${pageNo}">
				<input type="hidden" name="id" value="${sessionScope.id}">
				<input type="hidden" name="nickname" value="${sessionScope.nickname}">
				<input type="hidden" name="profile" value="${sessionScope.profile}">
				 작성일:<input type="hidden" name="r_date" value="<%=sf.format(nowTime)%>"><%=sf.format(nowTime)%><br>
				</td>
				<td><textarea rows="3" cols="50" name="replyContent"
						id="replyContent"></textarea></td>
				<td><input type="submit" value="댓글전송"
					style="width: 80px; height: 50px"></td>
			</tr>
		</table>
	</form>
	<!-- 댓글 리스트 출력 -->
	${id}
	<table id="rTable">
		<c:forEach var="reply" items="${rList}">
			<tr height="20" align="center">
				<td width="100">${reply.id}</td>
				<td width="100">${reply.replyContent}</td>
				<td width="200">${reply.r_date}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>