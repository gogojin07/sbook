<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>pwfind</title>
</head>
<body>
    <form action="pwfind" method="post">
        <table border="1">
            <tr>
                <td colspan="2" align="center" bgcolor="skyblue">비밀번호찾기</td>
            </tr>

            <tr>
                <td>아이디<input type="text" name="id"></td>
            <tr>
                <td>이메일<input type="text" name="email"></td>

            </tr>
            <tr>
                <td colspan="2" align="center"><button>비밀번호찾기</button></td>
            </tr>

            <tr>
                <td colspan="2" align="center" bgcolor="skyblue">
                <a href="./">로그인</a>
                <a href="./join">회원가입</a>
                <a href="./idfindfrm">아이디찾기</a></td>
            </tr>
         </table>
    </form>
</body>
</html>