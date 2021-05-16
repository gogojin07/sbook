<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>pwfind</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	// page load
	$(document).ready(function(e){
		console.log("hi");
		
		// 아이디 찾기
	    $(document).on('click', '.btnFindPw', function(e){
	        
	    	var $id = $('.id');
	        var $email = $('.email');
	        
	        
	        if(!$id.val()){
	            alert("아이디를 작성해주세요.");
	            return false;
	        }
	        
	        if(!$email.val()){
	            alert("이메일을 입력해주세요.");
	            return false;
	        }	        
	        
	        var resultObj = { "id" : $id.val(), "email" : $email.val() };
	        console.log(resultObj);
	        $.ajax({
	               type: "post",
	               url: "/pwfind",
	               data: resultObj,	               
	               // datatype: "json",
	               beforeSend: function() { 
	               },
	               complete: function (data, status) {
	               },
	               success: function (data, status) {          
	            	   console.log(data);
	            	   if(data.status == "success"){
	            		   alert("비밀번호는 " + data.pw + " 입니다.");
	            	   }else {
	            		   alert("비밀번호 찾기에 실패하였습니다.")
	            	   }
	                   
	               },
	               error: function (xhr, status, err){
	            	   alert("통신을 실패하였습니다.");
	               }    
	           });
	    });
	});
</script>
</head>
<body>
    <!-- <form action="pwfind" method="post"> -->
        <table border="1">
            <tr>
                <td colspan="2" align="center" bgcolor="skyblue">비밀번호찾기</td>
            </tr>

            <tr>
                <td>아이디<input type="text" name="id" class="id"></td>
            <tr>
                <td>이메일<input type="text" name="email" class="email"></td>

            </tr>
            <tr>
                <td colspan="2" align="center"><button class="btnFindPw">비밀번호찾기</button></td>
            </tr>

            <tr>
                <td colspan="2" align="center" bgcolor="skyblue">
                <a href="./">로그인</a>
                <a href="./join">회원가입</a>
                <a href="./idfindfrm">아이디찾기</a></td>
            </tr>
         </table>
    <!-- </form> -->
</body>
</html>