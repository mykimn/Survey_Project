<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>색깔 심리테스트</title>
<style>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Anton|Passion+One|Archivo+Black');
* {
	font-family: 'Song Myung', cursive;
}
body{
	background:-webkit-linear-gradient(20deg, rgb(245,201,201), rgb(145,166,207));
}
table{
	margin-left:35%;
}
table tr td{
	text-align:center;
	background-color:white;
}
table tr th{
	background-color:yellow;
}
h3{
	margin-left:46%;
}
div{
	display:inline;
}
</style>
</head>
<body>
<h3>오늘의 설문조사</h3>
<table border=1 cellspacing=0 cellpadding=0>
	<tr width="120px;">
		<th width="120px;">닉네임</th>
		<th width="120px;">비밀번호</th>
		<th width="120px;">투표 항목</th>
		<th width="180px;">투표일</th>
	</tr>
	<%
	
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int i=0;
		int j = 0;
		int count = 0;
		int tmp = 0;
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

		int colorarr1[] = new int[10];
		for(int x = 0; x < i; x++){
			//out.println(infor[x][2]+"<br>");
			switch(infor[x][2]){
			case "red" : colorarr1[0]++; break;
			case "orange" : colorarr1[1]++; break;
			case "yellow" : colorarr1[2]++; break;
			case "green" : colorarr1[3]++; break;
			case "blue" : colorarr1[4]++; break;
			case "indigo" : colorarr1[5]++; break;
			case "violet" : colorarr1[6]++; break;
			case "grey" : colorarr1[7]++; break;
			case "black" : colorarr1[8]++; break;
			case "white" : colorarr1[9]++; break;
			}
		}
		int sum1 = 0;
		for(int a = 0; a<10;a++){
			sum1 += colorarr1[a];
		}
		
		if(id.equals("hoshi")){
			if(pw.equals("0615")){
				for(int h = 0; h < i; h++){ %>
				<tr>
		<% 			for(int s = 0; s < 4; s++){%>
							<td><%=infor[h][s]%></td>
		<%			} %>
				</tr>
<%				}
				++tmp;
			}
			else{
				out.println("<script>alert('비밀번호가 일치하지 않습니다.'); document.location.href='survey_homeAdmin.jsp'; </script>");
				--tmp; %>	
	<%		}
		}
		if(tmp==0){
			out.println("<script>alert('관리자가 아니므로 접근이 불가합니다.'); document.location.href='survey_homeAdmin.jsp'; </script>");
		}
		
%>
</table>
<h3>어제  VS 오늘</h3>
<%

	int w=0;
	int r = 0;
	int cnt = 0;
	int temp = 0;
	String yesInfor[][] = new String[50][4];
	Calendar ca = Calendar.getInstance();
	int dat = ca.get ( ca.DATE )-1;
	String dir1 = application.getRealPath("/WEB-INF/result/");
	String fileDir = dir1+"/survey"+dat+".txt";
	try{
		FileReader fr = new FileReader(fileDir); //파일읽기객체생성
		BufferedReader br = new BufferedReader(fr); //버퍼리더객체생성
		
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기 
			yesInfor[w][r] = line;
			++cnt;
			++r;
			if(cnt%4==0){
				++w;
				r=0;
			}
		}
	} catch (IOException e) { 
	  System.out.println(e.toString()); //에러 발생시 메시지 출력
	}

	int colorarr[] = new int[10];
	for(int x = 0; x < w; x++){
		//out.println(infor[x][2]+"<br>");
		switch(yesInfor[x][2]){
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
<div style="margin-left:37%; float: left;">
	<table width="150">
		<tr>
			<th>색상</th>
			<th>수</th>
		</tr>
		<tr>
			<td>빨간색</td>
			<td><%=colorarr[0] %></td>
		</tr>
		<tr>
			<td>주황색</td>
			<td><%=colorarr[1] %></td>
		</tr>
		<tr>
			<td>노란색</td>
			<td><%=colorarr[2] %></td>
		</tr>
		<tr>
			<td>초록색</td>
			<td><%=colorarr[3] %></td>
		</tr>
		<tr>
			<td>파란색</td>
			<td><%=colorarr[4] %></td>
		</tr>
		<tr>
			<td>남색</td>
			<td><%=colorarr[5] %></td>
		</tr>
		<tr>
			<td>보라색</td>
			<td><%=colorarr[6] %></td>
		</tr>
		<tr>
			<td>회색</td>
			<td><%=colorarr[7] %></td>
		</tr>
	    <tr>
			<td>검은색</td>
			<td><%=colorarr[8] %></td>
		</tr>
		<tr>
			<td>하얀색</td>
			<td><%=colorarr[9] %></td>
		</tr>
		<tr>
			<td>총 투표수</td>
			<td><%=sum %></td>
		</tr>
	</table>
</div>
<div style="float: left; margin-left:3%;">
	<table width="150">
		<tr>
			<th>색상</th>
			<th>수</th>
		</tr>
		<tr>
			<td>빨간색</td>
			<td><%=colorarr1[0] %></td>
		</tr>
		<tr>
			<td>주황색</td>
			<td><%=colorarr1[1] %></td>
		</tr>
		<tr>
			<td>노란색</td>
			<td><%=colorarr1[2] %></td>
		</tr>
		<tr>
			<td>초록색</td>
			<td><%=colorarr1[3] %></td>
		</tr>
		<tr>
			<td>파란색</td>
			<td><%=colorarr1[4] %></td>
		</tr>
		<tr>
			<td>남색</td>
			<td><%=colorarr1[5] %></td>
		</tr>
		<tr>
			<td>보라색</td>
			<td><%=colorarr1[6] %></td>
		</tr>
		<tr>
			<td>회색</td>
			<td><%=colorarr1[7] %></td>
		</tr>
	    <tr>
			<td>검은색</td>
			<td><%=colorarr1[8] %></td>
		</tr>
		<tr>
			<td>하얀색</td>
			<td><%=colorarr1[9] %></td>
		</tr>
		<tr>
			<td>총 투표수</td>
			<td><%=sum1 %></td>
		</tr>
	</table>
</div>
</body>
</html>