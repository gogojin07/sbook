
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
	height: 100%;
	margin: 0
}

.my-box {
	float: left;
	width: 200px;
	height: 100px;
}

.fas {
	postion: relative;
	width: 200px;
	height: 200px;
	width: 200px;
}

.book {
	position: relative;
}

.bookcover {
	position: relative;
	z-index: 1;
}

.booktext {
	position: relative;
}
</style>



</head>
<body>
	<h3>theme 리스트</h3>

	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table>
		<c:forEach var="theme" items="${tList}">

			<c:if test="${i%j==0}">
				<tr>
					<br>
					<br>
			</c:if>

			<td align="center" class="font" width="100" height="120"><a
				style="color: ${theme.color}"
				href="index?frm=searchpageview.jsp&id=${id}&themeNo=${theme.themeNo}"
				onclick="articleView(${theme.themeNo})"><i
					class="fas fa-book fa-5x"></i><br> ${theme.themename}</a></td>
			<c:if test="${i%j == j-1 }">
				</tr>
			</c:if>
			<c:set var="i" value="${i+1 }" />


		</c:forEach>
	</table>
<c:forEach var="guestbook" items="${gList}">
<div><a href="index?frm=guestList.jsp&id=${id}&guestno=${guestbook.guestno}"><i class="fas fa-book fa-5x"></i><br>방명록</a> </div>
</c:forEach>

</body>
<script>
	console.log(uList);
</script>
</html>


