<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
request 영역
: 클라이언트가 요청을 할 때마다 새로운 request 객체가 생성되어 
같은 요청을 처리하는 데 사용되는 모든 JSP가 영역을 공유
즉 request 영역에 저장된 정보는 현재 페이지와 포워드된 페이지까지 공유됨
*/
/*
request를 포함한 4가지 영역에 속성을 저장할 때는 setAttribute() 메서드 사용
저장을 위한 Key와 Value를 지정하여 마치 Map과 같은 형태로 저장됨
request 영역에 String과 Person 인스턴스 저장
저장 시에는 Object를 기반으로 자동형변환된다.
*/
request.setAttribute("requestString", "request 영역의 문자열");   
request.setAttribute("requestPerson", new Person("안중근", 31));
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 영역의 속성값 삭제하기</h2>
	<%
	//해당 속성값 데이터 삭제
	request.removeAttribute("requestString");
	//만약 해당 속성값이 없다면 삭제되지 않고 에러도 없다
	request.removeAttribute("requestInteger");
	%>
	<h2>request 영역의 속성값 읽기</h2>
	<%
	/*
	Person 인스턴스는 저장도ㅙ 있으므로 값을 얻어온 후 Person 타입으로 형변환
	영역에 저장 시 Object로 자동형변환되어 있으므로 
	사용 시에는 강제형변환(다운캐스팅) 해야한다
	*/
	Person rPerson=(Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
	<!-- 앞에서 삭제했으므로 null 출력됨 -->
	<li>String 객체 :<%= request.getAttribute("requestString") %> </li>
	<li>Person 객체 :<%= rPerson.getName() %>,<%= rPerson.getAge() %> </li>
	</ul>
	<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
	<!-- 
	포워드 : 현재 페이지로 들어온 요청을 다음 페이지로 보내는 기능
			즉 하나의 요청을 둘 이상의 페이지가 공유할 수 있다.
			포워드 명령을 만나기 전까지의 모든 내용은 버퍼에서 삭제되고 
			포워드된 페이지의 내용만 화면에 출력하는 특징을 가진다.
			즉 포워드란 현재 페이지로 들어온 요청을 다른
			페이지에서도 공유할 수 있도록 전달하는 것으로 주소 표시줄에는 
			최초 요청을 받은 페이지명이 나오고 웹브라우저에는 요청이 전달된
			페이지가 출력된다.
			
	 -->
	<%
	request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
		%>
	<a href="RequestForward.jsp">포워드 페이지로 이동</a>
</body>
</html>