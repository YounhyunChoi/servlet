<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import='java.net.URLEncoder' %>
<%
	session.setAttribute("userId", request.getParameter("userId"));

	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String errorUrl = "login.jsp?msg=" + URLEncoder.encode("아이디 혹은 비밀번호가 올바르지 않습니다.", "utf-8");
	
	if(userId == null || password == null) 
		session.setAttribute("login", "fail");
	else if(userId.equals("java") && password.equals("java")) 
		session.setAttribute("login", "success");
	else session.setAttribute("login", "fail");
	
	if(session.getAttribute("login").equals("success")) {
%>
		<c:redirect url='main.jsp'/>
<% 	
	} else {
%>
		<c:redirect url='<%= errorUrl %>'/>
<%
	}
%>