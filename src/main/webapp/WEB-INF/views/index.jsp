<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<title>index</title>
<style>
#header {
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	height: 100px;
	/* background: #51d1c0; */
	/* overflow: auto; */
}

#main {
	position: fixed;
	left: 0;
	right: 0;
	top: 100px;
	overflow: auto;
	height: 700px;
	background: white;
}

#menu {
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	height: 100px;
}
}
</style>
</head>
<body>
 <%
        String frm = request.getParameter("frm");
 
    %>

	<div id="header">

		<jsp:include page="main/header.jsp" />

	</div>

	 <div>
		<jsp:include page="main/menu.jsp" />
	</div> 
<center>
	<div id="main">
		<jsp:include page="<%=frm%>"/>
	</div>
</center>

	<div id="footer">
		<center>
			<jsp:include page="main/footer.jsp" />
		</center>
	</div>








</body>


</html>
