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
</head>
<body>
<%  
	request.setCharacterEncoding("UTF-8");
	String choose = request.getParameter("color");
	String name = request.getParameter("name");	
	String pw = request.getParameter("pw");
	
	Calendar cal = Calendar.getInstance();
	 
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
	   		fw.flush();
	   		fw.close();
    	} catch (IOException e) { 
    		out.println("쓰기 오류 발생");
    	}
%>
<center><h1>설문조사 완료되었습니다.</h1></center>
<form method="post" action="survey_result.jsp">
<input type="button" value="설문하러가기" onclick="location.href='survey_form.jsp'">
<input type="submit" value="결과보기">
</form>
</body>
</html>
