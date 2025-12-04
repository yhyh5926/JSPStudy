<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 로그인 폼</h2>
	<%
	/*
	get 방식으로 전달된 loginErr 파라미터가 있는 경우에만 "로그인 실패"를 출력한다.
	첫 실행 시에는 파라미터가 없는 상태이므로 메시지는 출력되지 않는다.
	*/
	String loginErr = request.getParameter("loginErr");
	if (loginErr != null)
		out.print("로그인 실패");
	%>
	<form action="./ResponseLogin.jsp" method="post">
		아이디 : <input type="text" name="user_id" /><br /> 패스워드 : <input
			type="text" name="user_pwd" /><br /> <input type="submit"
			value="로그인" />
	</form>

</body>


</html>