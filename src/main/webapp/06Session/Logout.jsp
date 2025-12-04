<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//로그아웃 처리1
session.removeAttribute("UserId");
session.removeAttribute("UserName");

//로그아웃 처리2
session.invalidate();

response.sendRedirect("LoginForm.jsp");
%>