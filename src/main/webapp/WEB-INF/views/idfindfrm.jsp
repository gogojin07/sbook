<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <title>idfind</title>
</head>
<body>
<form action="idfind" method="post">
    <table border="1">
        <tr>
            <td colspan="2" align="center" bgcolor="skyblue">아이디찾기</td>
        </tr>

        <tr>
            <td>이메일<input type="text" name="email"></td>
        </tr>

        <tr>
            <td>생일<input type="date" name="birth"></td> 
        </tr>

        <tr>
        <td colspan="2" align="center"><button>아이디찾기</button></td>
        </tr>

        <tr>
            <td colspan="2" align="center" bgcolor="skyblue">
            <a href="./">로그인</a>__
            <a href="./join">회원가입</a>
            <a href="./pwfindfrm">비밀번호찾기</a></td>
        </tr>

    </table>
</form>
</body>
</html>