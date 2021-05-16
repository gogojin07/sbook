<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>테마 표지 상세</h1>
	<form action="themecreate" name="themecreatefrm" method="post"
		onsubmit="return check()">
		<table>
			<%-- <c:forEach var="theme" items="${tList}"> --%>

			<tr>
				<td class="tg-ng7p" rowspan="6"><span id="colorB"><i id="book" class="fas fa-book fa-5x"></i></span></td>
				<td class="tg-ng7p">제목 : <input type=text name="themename">
				</td>
			</tr>
			<tr>
				<td class="tg-ng7p">색 : <input id="color" type="color" name="color"></td>
			</tr>
			<tr>
				<td class="tg-ng7p">공개여부 <input type="checkbox" name=open></td>
			</tr>
			<tr>
				<td class="tg-ng7p">다이어리<input type="checkbox" name="diaryopen"></td>
			</tr>
			<tr>
				<td class="tg-0pky">캘린더<input type="checkbox"
					name="calendaropen"></td>
			</tr>
			<tr>
				<td class="tg-0pky">id :${sessionScope.id}</td>
			</tr>

			<%-- </c:forEach> --%>
		</table>
		<br /><button onclick="myFunction()" type="submit">적용</button> <a
			href="/sb/index">돌아가기</a>
	</form>
</body>

<script type="text/javascript">
 let colorInput = document.getElementById('color');
 function myFunction() {

	document.getElementById('colorB').style.color=colorInput.value;
 }
</script>

</html>