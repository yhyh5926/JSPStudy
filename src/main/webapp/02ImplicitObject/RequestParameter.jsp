<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/*
Tomcat 구 버전에서는 POST방식으로 한글을 전송하는 경우 깨짐 현상이 발생되어 인코딩 처리를 해야 한다.
최신 버전에서는 해결되었지만 간혹 발생되는 경우가 있으므로 필요할 때 사용하면 된다.

*/
request.setCharacterEncoding("UTF-8");
/*
getParameter(): input 태그의 text, radio 처럼 하나의 값이 전송되는 경우 사용
				입력값이 문자, 숫자에 상관없이 String 타입으로 저장됨
getParameterValues() : checkbox처럼 2개 이상의 값이 전송되는 경우 사용
					   String 타입의 배열로 저장됨
*/
String id = request.getParameter("id");
String sex = request.getParameter("sex");
String[] favo = request.getParameterValues("favo");

/*
textarea는 2줄 이상의 입력이 가능하므로 엔터를 추가하는 경우 \r\n으로 저장된다
웬브라우저에 출력할 때는 <br> 태그로 변경해야 한다
*/
String favoStr="";
if(favo !=null){
	for(int i =0 ; i<favo.length; i++){
		favoStr += favo[i] + " ";
	}
	
}

String intro = request.getParameter("intro").replace("\r\n","<br/>");
%>

<ul style="list-style-type: decimal;">
	<li>아이디 : <%= id %></li>
	<li>성별 : <%= sex %></li>
	<li>관심사항 : <%= favoStr %></li>
	<li>자기소개: <%= intro %></li>
	<li>학력 : <%= request.getParameter("grade") %></li>
</ul>
</body>
</html>