<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ page import='java.util.StringTokenizer' %>
<a href='main.jsp'>진열대</a>
<h3>장바구니</h3>
<%
	String cart = "";
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie: cookies)
		if(cookie.getName().equals("cart"))
			cart = cookie.getValue();
	
	if(cart != "") {
		StringTokenizer products = new StringTokenizer(cart, "/");
%>
		<form action='cartDelProc.jsp' method='post'>
			<ul>
<%
				String product = "";
				while(products.hasMoreTokens()) {
					product = products.nextToken();
%>
					<li><%= product %> <input type='checkbox' name='product' value='<%= product %>'/></li>
<%
				}
%>			
			</ul>
			<button type='submit'>빼기</button>
		</form>
<%
		String msg = request.getParameter("msg");
		if(msg != null) out.println(msg);
	} else out.println("장바구니에 물건이 없습니다.");
%>
<%--
	List<String> cart = new ArrayList<>();
	boolean hasCart = false;
	
	StringTokenizer st = null;
	Cookie[] cookies = request.getCookies();
	
	for(Cookie cookie: cookies) {
		if(cookie.getName().equals("cart")) {
			String tmp = cookie.getValue();
			st = new StringTokenizer(tmp, "/");
			while(st.hasMoreTokens())
				cart.add(st.nextToken());
			hasCart = true;
		}
	}
	
	if(hasCart) {
		if(cart.size() > 0) {
%>
			<form action='cartDelProc.jsp' method='post'>
				<ul>
<%			
					for(String product: cart) {		
%>		
						<li><%= product %> <input type='checkbox' name='product' value='<%= product %>'/></li>
<%
					}
%>
				</ul>
				<button type='submit'>빼기</button>
			</form>
<%
			String msg = request.getParameter("msg");
			if(msg != null) out.println(msg);
		} else out.println("물건이 없습니다.");
	} else out.println("장바구니가 없습니다.");
--%>