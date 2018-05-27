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
label{
	cursor: pointer;
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
<p><input type="radio" id="c1" style="width:20px;height:20px;border:1px;" name="color" value="red"><font color="red"><label for="c1"> 빨간색</label></font><br></p>
<p><input type="radio" id="c2" name="color" value="orange"><font color="orange"><label for="c2"> 주황색</label></font><br></p>
<p><input type="radio" id="c3" name="color" value="yellow"><font color="yellow"><label for="c3"> 노란색</label></font><br></p>
<p><input type="radio" id="c4" name="color" value="green"><font color="green"><label for="c4"> 초록색</label></font><br></p>
<p><input type="radio" id="c5" name="color" value="blue"><font color="blue"><label for="c5"> 파란색</label></font><br></p>
<p><input type="radio" id="c6" name="color" value="indigo"><font color="indigo"><label for="c6"> 남색</label></font><br></p>
<p><input type="radio" id="c7" name="color" value="violet"><font color="purple"><label for="c7"> 보라색</label></font><br></p>
<p><input type="radio" id="c8"name="color" value="grey"><font color="grey"><label for="c8"> 회색</label></font><br></p>
<p><input type="radio" id="c9" name="color" value="black"><label for="c9"> 검은색</label><br></p>
<p><input type="radio" id="c10" name="color" value="white"><font color="white"><label for="c10"> 흰색</label></font><br></p>
<input type="hidden" name="name" value="<%=name%>">
<input type="hidden" name="pw" value="<%=pw%>">
<input type="submit" value="투표하기">
<input type="button" value="결과보기" onclick="location.href='survey_result.jsp'">
</form></center>
</body>
</html>