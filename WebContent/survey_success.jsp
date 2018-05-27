<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>설문조사 완료</title>
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
input[type=submit],input[type=button]{
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
<%  
	request.setCharacterEncoding("UTF-8");
	String choose = request.getParameter("color");
	String name = request.getParameter("name");	
	String pw = request.getParameter("pw");
	
	Calendar cal = Calendar.getInstance();
	Date da = new Date();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm aaa");
	//현재 년도, 월, 일
	int date = cal.get ( cal.DATE ) ;
	
    String fileName = "survey"+date+".txt"; //생성할 파일명
	String dir = application.getRealPath("/WEB-INF/result/");
	String filePath = dir+"/"+fileName;
    	try{
	
			BufferedWriter fw = new BufferedWriter(new FileWriter(filePath,true));
    	
			fw.write(name+"\r\n");
			fw.write(pw+"\r\n");
	   		fw.write(choose+"\r\n");
	   		fw.write(sd.format(da)+"\r\n");
	   		fw.flush();
	   		fw.close();
    	} catch (IOException e) { 
    		out.println("쓰기 오류 발생");
    	}
%>
<center><h1 style="margin-top:17%;">설문조사 완료되었습니다.</h1></center>
<form method="post" action="survey_result.jsp">
<input type="button" value="설문하러가기" onclick="location.href='index.jsp'">
<input type="submit" value="결과보기">
</form>
</body>
</html>
