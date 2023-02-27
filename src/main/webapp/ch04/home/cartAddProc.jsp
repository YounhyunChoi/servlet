<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%
	String cart = "";
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie: cookies)
		if(cookie.getName().equals("cart"))
			cart = cookie.getValue();
	
	String[] products = request.getParameterValues("product");
	if(products != null && products.length > 0) {
		for(String product: products)
			cart += product + "/";
		
		Cookie cookie = new Cookie("cart", cart);
		cookie.setMaxAge(60 * 60 * 24 * 7);
		response.addCookie(cookie);
	} else {
%>
		<c:redirect url='main.jsp'>
			<c:param name='msg' value='장바구니에 담을 물건을 선택하세요.'/>	
		</c:redirect>
<%
	}
%>
<c:redirect url='cartOut.jsp'/>
<%--
	String[] products = request.getParameterValues("product");

	if(products != null) {
		String cart = "";
		
		Cookie[] cookies = request.getCookies();
		
		for(Cookie cookie: cookies) {
			if(cookie.getName().equals("cart")) {
				cart = cookie.getValue();
			}
		}
		
		for(String product: products) cart += product + "/";
		
		Cookie cookie = new Cookie("cart", cart);
		cookie.setMaxAge(60 * 60 * 24 * 7);
		response.addCookie(cookie);
%>
		<c:set var='url' value='cartOut.jsp'/>
<%
	} else {
%>
		<c:set var='url' value='<%= "main.jsp?msg=" + 
			URLEncoder.encode("장바구니에 담을 물건을 선택하세요.", "utf-8") %>'/>
<%
	}
%>
<c:redirect url='${url}'/>
--%>