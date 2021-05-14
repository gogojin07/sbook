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
	<form name="form" method="post">
		<table>
			<c:forEach var="theme" items="${tList}">
				<input type="hidden" name="themeNo" value="${theme.themeNo}">
				<tr>
					<td class="tg-ng7p" rowspan="6"><i class="fas fa-book fa-5x"></i></td>
					<td class="tg-ng7p">제목 : <input type=text name="themename"
						value="${theme.themename}">
					</td>
				</tr>
				<tr>
					<td class="tg-ng7p">색 : <input type=color name="color"
						value="${theme.color}"></td>
				</tr>
				<tr>
					<td class="tg-ng7p">공개여부 <input type="checkbox" name=open
						value="${theme.open}"></td>
				</tr>
				<tr>
					<td class="tg-ng7p">다이어리<input type="checkbox"
						name="diaryopen" value="${theme.diaryopen}"></td>
				</tr>
				<tr>
					<td class="tg-0pky">캘린더<input type="checkbox"
						name="calendaropen" value="${theme.calendaropen}"></td>
				</tr>
				<tr>
					<td class="tg-0pky">id :${sessionScope.id}</td>
				</tr>


			</c:forEach>
		</table>
		<br /> <input type="submit" value="등록"  onclick="javascript: form.action='themeupdate';">
				<input type="submit" value="삭제" onclick="javascript: form.action='themedelete';">
		<a href="/sb/index?frm=themeset.jsp">돌아가기</a>
	</form>
</body>
<script type="text/javascript">

	

</script>

</html>