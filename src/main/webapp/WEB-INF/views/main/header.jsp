<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Neucha|Cabin+Sketch&display=swap">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/bootstrap.css" />
<link rel="icon" type="image/png"
	href="${path}/resources/img/sbook1.png" /> 
<style type="text/css">

img{
   width : 150px;
   height: 110px;
}
</style>

</head>
<body>
	 <div class="head" align="center">
		

			<table height="100">
				<tr>
					<td width="200">로고</td>
					<td width="500" align="right">
					<form action="index"  method="Get"><input type="hidden" name="frm" value="searchfrm.jsp"><input type="text" name="nickname"><input type="submit"
					value="검색"></form></td>
					<td> ${sessionScope.nickname}</td>
			</table>
		
	</div> 

	<%-- <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<!-- <div class="container-fluid"> -->
			<a class="navbar-brand" href='index?frm=menubar/themelist.jsp'><img src="resources/img/sbook1.png"></a>
			<!-- <button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button> -->

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active" href='index?frm=writefrm.jsp'>Write
							<!-- <span class="visually-hidden">(current)</span> -->
					</a></li>
					<li class="nav-item"><a class="nav-link" href='index?frm=themeset.jsp'>책관리</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="index?frm=guestList.jsp">방명록</a>
					</li>
					<li class="nav-item"><a class="nav-link" href='index?frm=myinfo.jsp'>설정</a></li>
					<li class="nav-item"><a class="nav-link" href='logout'>로그아웃</a>
					</li>
					
				</ul>
				
				<form class="d-flex" action="index" method="Get">
					<div style="color: white; float: left;">${sessionScope.nickname}</div>
					<input type="hidden" name="frm" value="searchfrm.jsp"> <input
						class="form-control me-sm-2" type="text" name="nickname"
						placeholder="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
					
				</form>
			</div>
		<!-- </div> -->
	</nav> --%>
</body>
</html>
