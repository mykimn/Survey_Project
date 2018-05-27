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
</head>
<body>
<table border=1 cellspacing=0 cellpadding=0>
	<tr>
		<th>닉네임</th>
		<th>비밀번호</th>
		<th>투표 항목</th>
		<th>투표일</th>
	</tr>
	<%
	
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int i=0;
		int j = 0;
		int count = 0;
		int tmp = 0;
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
</body>
</html>