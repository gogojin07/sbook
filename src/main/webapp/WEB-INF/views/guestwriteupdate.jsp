<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<%@ page import="java.sql.*" %>
<% String sql = "select *from theme"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 글쓰기</title>
<style type="text/css">
/* #themeno{
	margin-left : 32%;
	width : 12%;
	float: left;
} */
#themename{
margin-left :40%;
	width : 12%;
	float: left;
}
#guestno{
	width : 12%;
	float: left;
}
#guestcontent {
	width: 40%;
	height: 40%;
}
#reset{
	margin-left	: 39%;
	width : 10%;
	float: left;
}
#submit{
	margin-left : 1%;
	width : 10%;
	float: left;	
}

</style>
</head>
<body>
	<h2>방명록</h2>
	<form action="guestupdate" name="guestwriteupdate" method="post">
	<c:forEach var="guest" items="${gList}">
	<input type="hidden" name="profile" value="${guest.profile}">
	<input type="hidden" name="gbnumber" value="${guest.gbnumber}">
			<input type="hidden" name="guestno" value="${guest.guestno}">
			<input type="hidden" name="id" id="id" value="${sessionScope.id}">
			<input type="hidden" name="nickname" value="${sessionScope.nickname}">
			<input type="hidden" name="g_date" class="form-control"
				value="<%=sf.format(nowTime)%>">
			
			<h4><%=sf.format(nowTime)%></h4>
			<br>
			<textarea name="guestcontent" id="guestcontent"
				placeholder="내용을 입력해주세요" class="form-control">${guest.guestcontent}</textarea><br>
			<button type="reset" class="form-control" id="reset">취소</button>
			<button type="submit" class="form-control" id="submit">수정완료</button>
	</c:forEach>
	</form>
</body>
</html>