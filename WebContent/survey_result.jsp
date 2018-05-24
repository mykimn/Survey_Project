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
</head>
<body>
<%
	int colorarr[] = new int[10];
	int i=0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[30][3];
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
			if(count%3==0){
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
		out.println(infor[x][2]+"<br>");
		switch(infor[x][2]){
		case "red" : colorarr[0]++;
		
		}
	}
	
	
%>
</body>
</html>