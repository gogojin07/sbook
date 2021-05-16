<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>idfind</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	// page load
	$(document).ready(function(e){
		console.log("hi");
		
		// 아이디 찾기
	    $(document).on('click', '.btnFindId', function(e){
	        
	        var $email = $('.email');
	        var $date = $('.date');
	        
	        if(!$email.val()){
	            alert("이메일을 입력해주세요.");
	            return false;
	        }
	        
	        if(!$date.val()){
	            alert("날짜를 작성해주세요.");
	            return false;
	        }
	        
	        var date_data = $date.val().replaceAll("-", "");
	        
	        var resultObj = { "email" : $email.val(), "date": date_data };
	        console.log(resultObj);
	        $.ajax({
	               type: "post",
	               url: "/idfind",
	               data: resultObj,	               
	               // datatype: "json",
	               beforeSend: function() { 
	               },
	               complete: function (data, status) {
	               },
	               success: function (data, status) {          
	            	   console.log(data);
	            	   if(data.status == "success"){
	            		   alert("아이디는 " + data.id + " 입니다.");
	            	   }else {
	            		   alert("아이디 찾기에 실패하였습니다.")
	            	   }
	                   
	               },
	               error: function (xhr, status, err){
	            	   alert("통신을 실패하였습니다.");
	               }    
	           });
	    });
	});
</script>
<body>
<!-- <form action="idfind" method="post"> -->
    <table border="1">
        <tr>
            <td colspan="2" align="center" bgcolor="skyblue">아이디찾기</td>
        </tr>

        <tr>
            <td>이메일<input type="text" name="email" class="email"></td>
        </tr>

        <tr>
            <td>생일<input type="date" name="birth" class="date"></td> 
        </tr>

        <tr>
        <td colspan="2" align="center"><button class="btnFindId">아이디찾기</button></td>
        </tr>

        <tr>
            <td colspan="2" align="center" bgcolor="skyblue">
            <a href="./">로그인</a>__
            <a href="./join">회원가입</a>
            <a href="./pwfindfrm">비밀번호찾기</a></td>
        </tr>

    </table>
<!-- </form> -->
</body>
</html>