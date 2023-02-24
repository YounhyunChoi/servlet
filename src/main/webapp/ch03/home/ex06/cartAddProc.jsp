<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ page import='java.util.List, java.util.ArrayList' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%
	String[] products = request.getParameterValues("product");

	if(products != null && products.length > 0) {
		List<String> cart = null;
		
		Object cartObj = session.getAttribute("cart");
		if(cartObj == null) {
			cart = new ArrayList<>();
			session.setAttribute("cart", cart);
		} else cart = (List<String>)cartObj;
		
		for(String product: products)
			cart.add(product);
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
	
	List<String> cart = (List<String>)session.getAttribute("cart");
	if(cart == null) cart = new ArrayList<>();
	
	String[] products = request.getParameterValues("product");

	if(products != null && products.length > 0) {
		for(String product: products)
			cart.add(product);
		
		session.setAttribute("cart", cart);
%>
		<c:redirect url='cartOut.jsp'/>
<%
	} else {
%>
		<c:redirect url='main.jsp?msg=choice products'/>
<%
	}
--%>
