<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta property="og:type" content="website" />
<meta property="og:title" content="COLOR SURVEY" />
<meta property="og:url" content="https://github.com/mykimn/Survey_Project" />
<meta property="og:description" content="10가지 색상 중 가장 좋아하는 색상을 투표하고, 성향을 확인하세요!" />

<script>
function fbshareing(url,text){
	window.open("http://twitter.com/intent/tweet?text="+text+"&url="+url);
}
function bshareing(){
	window.open("https://www.facebook.com/sharer/sharer.php"
			+"?u="+encodeURIComponent('https://github.com/mykimn/Survey_Project'));
}
</script>
<title>설문조사 결과보기</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Anton|Passion+One|Archivo+Black');
* {
	font-family: 'Song Myung', cursive;
}
body{
	background:-webkit-linear-gradient(20deg, rgb(245,201,201), rgb(145,166,207));
}
.resultDiv{
	margin-left:26%;
	width:50%;
	height:510px;
	border-radius:5px;
	background-color: #ffffff;
	font-size:large;
	line-height:160%;
}
input[type=button]{
    width: 13%;
    background-color:#666699;
    color: white;
    padding: 5px 5px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left:2%;
    font-size:large;
    margin-top:2%;
}
</style>
</head>
<body>
<h1 style="text-align:center; margin-left:25px;">MY SURVEY RESULT</h1>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	
	int i = 0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[30][4];
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
	int tmp = 0;
	String show="";
	String color="";
	String col = "";
	for(int a = 0; a<i;a++){
		if(name.equals(infor[a][0])){
			if(pw.equals(infor[a][1])){
				show = name+"님이 선택하신 색상은 ";
				color = infor[a][2];
				switch(infor[a][2]){
					case "red" : show += "빨간색"; col = "빨간색"; break;
					case "orange" : show += "주황색"; col = "주황색"; break;
					case "yellow" : show += "노란색"; col = "노란색"; break;
					case "green" : show += "초록색"; col = "초록색"; break;
					case "blue" : show += "파란색"; col = "파란색"; break;
					case "indigo" : show += "남색"; col = "남색"; break;
					case "violet" : show += "보라색"; col = "보라색"; break;
					case "grey" : show += "회색"; col = "회색"; break;
					case "black" : show += "검은색"; col = "검은색"; break;
					case "white" : show += "하얀색"; col = "하얀색"; break;
				}
				//out.println(infor[a][2]);
				++tmp;
			}
			else{
				out.println("<script>alert('비밀번호가 일치하지 않습니다.'); document.location.href='survey_myresult.jsp'; </script>");
				--tmp; %>
<%			}
		}
	}
	if(tmp==0){
		out.println("<script>alert('해당하는 닉네임이 존재하지 않습니다.'); document.location.href='index.jsp'; </script>"); %>
<% 	}
	/*
	for(int x = 0; x < i; x++){
		for(int y = 0; y<3; y++){
			out.println(infor[x][y]+"<br>");
		}
	}*/
	
%>
<div class="resultDiv">
<label style="margin-bottom:3%;">--------------------------------------------------------------------------------------------------------------------------------------------------------------------</label>
<label style="font-size:x-large; margin-top:20%;"><center><%=show %><center></label>
<img src="<%=color %>.jpg" style="margin-left:0%; margin-top:3%; display:block; margin-bottom:2%;">
<%
	request.setCharacterEncoding("UTF-8");
	String dir2 = application.getRealPath("/WEB-INF/result/");
	String fileDir = dir2+"/result"+color+".txt";
	String str[] = new String[30];
	int z = 0;
	try{
		File fr = new File(fileDir); //파일읽기객체생성
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(fileDir),"UTF8"));
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기 %>
			<span style="font-size:medium; margin-top:200px; text-align:left;"><%=line+"<br>"%></span>
<%		}
	} catch (IOException e) { 
	  System.out.println(e.toString()); //에러 발생시 메시지 출력
	}
%>

</div>
<input type="button" value="내 설문 결과보기" style="margin-left:22%;" onclick="location.href='survey_myresult.jsp'">
<input type="button" value="트위터에 공유하기" onclick="fbshareing('http://localhost:8080/New_Survey/homeIndex.jsp','<%=name%>님이 선택한 색상은 <%=col %>이네요! 당신도 10가지 색상 중 가장 좋아하는 색상을 투표하고 성향을 알아보세요.');">
<input type="button" value="페이스북에 공유하기" onclick="bshareing();">
<input type="button" value="홈으로 이동" onclick="location.href='homeIndex.jsp'">
</div>
</body>
</html>