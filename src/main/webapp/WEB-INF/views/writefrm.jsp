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
<title>글쓰기</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script src="/ckeditor/ckeditor.js"></script> 
  
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
#frm{
	margin: 30px;
}
.form-control{
	width : 60%;
}
#pagesheet{
 	width : 20%;
 	float: left;
}
#pageopen{
	width : 20%;
	float: left;
}
#Date{
	width : 20%;
	margin-left : 20%;
	float : left;
}
#wri{
	float : left;
	margin-left: 50px;

}
#reset{
	float : left;
	margin-left : 30%;
}
#pagecontent{
	width : 40%;
}


</style> 
</head>
<body>
	<form name="form1" method="post" action="insert" id="frm">
	
		<input type="date" id="Date" name="p_date"
			class="form-control">
		<select name="pagesheet"
			id="pagesheet" class="form-control">
			<option>속지선택</option>
			<option>선</option>
			<option>백지</option>
			<option>모눈종이</option>
		</select> <select name="pageopen" id="pageopen" class="form-control">
			<option>공개여부</option>
			<option>전체공개</option>
			<option>친구만</option>
			<option>비공개</option>
		</select><br><br>
		<input type="hidden" id="id" name="id" value="${sessionScope.id}"> 
		<select name="themeNo" id="themeNo" class="form-control">
			<c:forEach var="theme" items="${tList}">
				<option value="${theme.themeNo}">${theme.themename}</option>
			</c:forEach>
		</select>
		<table id=table> 
		<div>
			<textarea name="pagecontent" id="pagecontent" class="form-control" 
				placeholder="내용을 입력해주세요"></textarea>
				   <script>
                CKEDITOR.replace( 'pagecontent' );
            </script><br>
		
		</div>
		</table>
		<div id="pp">
		  작성일:<input type="hidden" name="writedate" id="writedate" value="<%=sf.format(nowTime)%>"><%=sf.format(nowTime)%><br>
			<button type="reset" id="reset" class="btn btn-danger">취소</button> 
			<button type="submit" class="btn btn-primary" id="wri">글작성</button>
		</div>
	
	</form>

	<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</body>
</html>