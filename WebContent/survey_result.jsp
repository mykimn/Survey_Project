<%@page import="java.util.Calendar"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>설문조사 결과보기</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Anton|Passion+One|Archivo+Black');
* {
	font-family: 'Song Myung', cursive;
}
body{
	background:-webkit-linear-gradient(20deg, rgb(245,201,201), rgb(145,166,207));
}
label{
    display:inline-block;
    width:60px;
    margin-left:15px;
}
.resultDiv{
	margin-left:26%;
	width:50%;
	height:400px;
	border-radius:5px;
	background-color: #ffffff;
	font-size:large;
	line-height:160%;
}
input[type=button]{
    width: 20%;
    background-color:#666699;
    color: white;
    padding: 5px 5px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left:3%;
    font-size:large;
}
</style>
</head>
<body>
<h1 style="text-align:center;">COLOR SURVEY RESULT</h1>
<%
	int colorarr[] = new int[10];
	int i=0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[50][4];
	Calendar cal = Calendar.getInstance();
	String dir = application.getRealPath("/WEB-INF/result/");
	String filePath = dir+"/survey"+cal.get ( cal.DATE )+".txt";
	try{
		FileReader fr = new FileReader(filePath); //파일읽기객체생성
		BufferedReader br = new BufferedReader(fr); //버퍼리더객체생성
		
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기
			infor[i][j] = line;
			++count;
			++j;
			if(count%4==0){
				++i;
				j=0;
			}
		}
	} catch (IOException e) { 
	  System.out.println(e.toString()); //에러 발생시 메시지 출력
	}
	/*
	for(int x = 0; x < i; x++){
		for(int y = 0; y<3; y++){
			out.println(infor[x][y]+"<br>");
		}
	}*/
	
	for(int x = 0; x < i; x++){
		//out.println(infor[x][2]+"<br>");
		switch(infor[x][2]){
		case "red" : colorarr[0]++; break;
		case "orange" : colorarr[1]++; break;
		case "yellow" : colorarr[2]++; break;
		case "green" : colorarr[3]++; break;
		case "blue" : colorarr[4]++; break;
		case "indigo" : colorarr[5]++; break;
		case "violet" : colorarr[6]++; break;
		case "grey" : colorarr[7]++; break;
		case "black" : colorarr[8]++; break;
		case "white" : colorarr[9]++; break;
		}
	}
	int sum = 0;
	for(int a = 0; a<10;a++){
		sum += colorarr[a];
	}
%>
<div class="resultDiv">
<label style="margin-top:20px;">빨간색</label> 
<%
	for(int b = 0; b<colorarr[0];b++){
		%><img src="r.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[0] %><br>
<label>주황색</label> 
<%
	for(int b = 0; b<colorarr[1];b++){
		%><img src="o.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[1] %><br>
<label>노란색</label>  
<%
	for(int b = 0; b<colorarr[2];b++){
		%><img src="y.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[2] %><br>
<label>초록색</label>  
<%
	for(int b = 0; b<colorarr[3];b++){
		%><img src="g.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[3] %><br>
<label>파란색</label>  
<%
	for(int b = 0; b<colorarr[4];b++){
		%><img src="b.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[4] %><br>
<label>남색</label>  
<%
	for(int b = 0; b<colorarr[5];b++){
		%><img src="i.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[5] %><br>
<label>보라색</label>  
<%
	for(int b = 0; b<colorarr[6];b++){
		%><img src="v.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[6] %><br>
<label>회색</label>  
<%
	for(int b = 0; b<colorarr[7];b++){
		%><img src="gr.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[7] %><br>
<label>검은색</label>  
<%
	for(int b = 0; b<colorarr[8];b++){
		%><img src="bl.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[8] %><br>
<label>하얀색</label>  
<%
	for(int b = 0; b<colorarr[9];b++){
		%><img src="wh.jpg" width="15" height="15">
<%	} %>&nbsp;<%= colorarr[9] %><br><br><br>
<label style="width:180px;">현재 설문조사 참여수 :</label><%= sum %>명
<input type="button" value="내 설문 결과보기" style="margin-left:120px;" onclick="location.href='survey_myresult.jsp'">
<input type="button" value="홈으로 이동" onclick="location.href='homeIndex.jsp'">
</div>
</body>
</html>