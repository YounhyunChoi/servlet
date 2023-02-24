<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%	
	Object userId = session.getAttribute("userId");
	if(userId == null) {
%>
		<a href='login.jsp'>로그인</a>
<%
	} else {
%>
		<%= userId %>님, 환영합니다. &nbsp;
		<a href='logout.jsp'>로그아웃</a>
<%
	}
%>