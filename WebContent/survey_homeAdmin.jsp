<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Anton|Passion+One|Archivo+Black');
* {
	font-family: 'Song Myung', cursive;
}
body{
	background:-webkit-linear-gradient(20deg, rgb(245,201,201), rgb(145,166,207));
}
form {
	font-size:x-large;
	text-align:center;
}
input[type=text],input[type=password]{
    width: 30%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit]{
    width: 20%;
    background-color: -webkit-linear-gradient(20deg, rgb(245,201,201), rgb(145,166,207));
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left:2%;
    margin-top:2%;
    font-size:x-large;
}
label{
	margin-left:-10px;
    display:inline-block;
    width:110px;
    line-height:170%;
}
</style>
</head>
<body>
<h1 style="text-align:center; margin-top:10%;"><font color="white">COLOR SURVEY ADMIN PAGE</font></h1>
<form method="post" action="survey_admin.jsp">
	<label style="margin-top:50px;">아이디</label><input type="text" name="id" required><br>
	<label>비밀번호 </label><input type="password" name="pw" required><br>
	<input type="submit" value="로그인">
</form>
</body>
</html>