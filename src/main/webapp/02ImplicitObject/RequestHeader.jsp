<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>3. 요청 헤더 정보 출력하기</h2>
	<%
	/*
	getHeaderNames() :  사용자의 요청 헤더 정보를 얻어올 때 사용하는 메서드
	반환 타입은 Enumeration 타입, 일종의 컬렉션 인스턴스이다
	*/
	Enumeration headers= request.getHeaderNames();
	while(headers.hasMoreElements()){
		String headerName=(String) headers.nextElement();
		String headerValue= request.getHeader(headerName);
		out.print("헤더명:" + headerName+ ", 헤더값:"  + headerValue +"<br/>" );
	}
	%>
	<p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다.</p>
	<!-- 
		user-agent : 사용자가 접속한 웹브라우저의 종류를 알 수 있다.
					크롬, 파이어폭스, 사파리 등
		referer :  웹서핑을 통해 특정한 링크를 클릭하여 다른 사이트로 방문하는 경우 
					남은 흔적을 말한다. 어떤 사이트를 통해 현재 페이지로 유입되었는지 알 수 있다.
		cookie :  웹서버가 브라우저를 통해 클라이언트의 컴퓨터에 남기는 흔적으로 텍스트 파일 형태로 저장된다
	 -->
</body>
</html>