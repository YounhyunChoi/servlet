<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<ul>
	<li>${user}</li>
	<li>${user.username}</li>
	<li>${pageScope.user.username}</li>
	<li>${requestScope.user.username}</li>
	<li>${sessionScope.user.username}</li>
	<li>${applicationScope.user.username}</li>
</ul>