<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>���� �ɸ��׽�Ʈ</title>
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
<center><h1>���� �����ϴ� ������ ����ּ���!</h1></center>
<center><form action="survey_result.jsp">
<p><input type="radio" style="width:20px;height:20px;border:1px;" name="color" value="red"><font color="red"><label id="color"> ������</label></font><br></p>
<p><input type="radio" name="color" value="orange"><font color="orange"> ��Ȳ��</font><br></p>
<p><input type="radio" name="color" value="yellow"><font color="yellow"> �����</font><br></p>
<p><input type="radio" name="color" value="green"><font color="green"> �ʷϻ�</font><br></p>
<p><input type="radio" name="color" value="blue"><font color="blue"> �Ķ���</font><br></p>
<p><input type="radio" name="color" value="indigo"><font color="indigo"> ����</font><br></p>
<p><input type="radio" name="color" value="violet"><font color="purple"> �����</font><br></p>
<p><input type="radio" name="color" value="grey"><font color="grey"> ȸ��</font><br></p>
<p><input type="radio" name="color" value="black"> ������<br></p>
<p><input type="radio" name="color" value="white"><font color="white"> ���</font><br></p>
<input type="button" value="��ǥ�ϱ�" onclick="location.href='survey_success.jsp'">
<input type="submit" value="�������">
</form></center>
</body>
</html>