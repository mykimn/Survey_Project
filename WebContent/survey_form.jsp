<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>색깔 심리테스트</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Anton|Passion+One|Archivo+Black');
* {
	font-family: 'Song Myung', cursive;
}
body{
	background:-webkit-linear-gradient(20deg, rgb(245,201,201), rgb(145,166,207));
}
form {
	font-size:xx-large;
}
input[type=radio]{
	width:20px;
	height:20px;
	border:1px;
	cursor: pointer;
}
input[type=submit], input[type=button]{
    width: 20%;
    background-color: -webkit-linear-gradient(20deg, rgb(245,201,201), rgb(145,166,207));
    color: black;
    padding: 14px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left:3%;
    font-size:x-large;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
%>
<center><h1>가장 좋아하는 색깔을 골라주세요!</h1></center>
<center><form action="survey_success.jsp" method="post">
<p><input type="radio" style="width:20px;height:20px;border:1px;" name="color" value="red"><font color="red"><label id="color"> 빨간색</label></font><br></p>
<p><input type="radio" name="color" value="orange"><font color="orange"> 주황색</font><br></p>
<p><input type="radio" name="color" value="yellow"><font color="yellow"> 노란색</font><br></p>
<p><input type="radio" name="color" value="green"><font color="green"> 초록색</font><br></p>
<p><input type="radio" name="color" value="blue"><font color="blue"> 파란색</font><br></p>
<p><input type="radio" name="color" value="indigo"><font color="indigo"> 남색</font><br></p>
<p><input type="radio" name="color" value="violet"><font color="purple"> 보라색</font><br></p>
<p><input type="radio" name="color" value="grey"><font color="grey"> 회색</font><br></p>
<p><input type="radio" name="color" value="black"> 검은색<br></p>
<p><input type="radio" name="color" value="white"><font color="white"> 흰색</font><br></p>
<input type="hidden" name="name" value="<%=name%>">
<input type="hidden" name="pw" value="<%=pw%>">
<input type="submit" value="투표하기">
<input type="button" value="결과보기" onclick="location.href='survey_result.jsp'">
</form></center>
</body>
</html>