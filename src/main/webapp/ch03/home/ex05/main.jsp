<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%	
	String login = (String)session.getAttribute("login");
	if(login == null) login = "";
	if(login.equals("success")) {
%>
		<%= session.getAttribute("userId") %>님, 환영합니다.
		<a href='logout.jsp'>logout</a>
<%
	} else {
%>
		<a href='login.jsp'>login</a>
<%
	}
%>