<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>
.dropbtn {
	background-color: #51d1c0;
	color: white;
	padding: 30px;
	font-size: 16px;
	border: 1;
	width: 160px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

.buttonbox {
	background-color: #f1f1f1;
	min-width: 160px;
	z-index: 1;
	height
}
</style>
</head>
<body>

	<div class="dropdown">
		<button class="dropbtn">메뉴</button>
		<div class="dropdown-content">
			<a href='index?frm=menubar/themelist.jsp'>메인화면</a> <a
				href='index?frm=writefrm.jsp'>글쓰기</a> <a
				href='index?frm=themeset.jsp'>책관리</a> <a href='index?frm=myinfo.jsp'>설정</a>
			<a href='logout'>로그아웃</a>
		</div>
	</div>

	</table>
</body>
<script>
	function dp_menu() {
		let click = document.getElementById("drop-content");
		if (click.style.display === "none") {
			click.style.display = "block";

		} else {
			click.style.display = "none";

		}
	}
</script>
</html>
