<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME</title>
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
input[type=button]{
    width: 40%;
    height: 400px;
    background-color: #EFF5FB;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top:2%;
    font-size:x-large;
    display:inline;
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
<h1 style="text-align:center; margin-top:10%;">WELCOME TO <font color="red">C</font><font color="orange">O</font><font color="yellow">L</font><font color="green">O</font><font color="blue">R</font> SURVEY</h1>
<form method="post">
<input type="button" value="설문하러가기" style="background-color: #92a8d1;" onclick="location.href='index.jsp'">
<input type="button" value="결과 확인" style="background-color: #f7cac9;" onclick="location.href='survey_result.jsp'">
</form>
</body>
</html>