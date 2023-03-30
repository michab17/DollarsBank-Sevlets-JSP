<%@page import="com.bank.model.Account"%>
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
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
	
		if(session.getAttribute("account") == null) {
			response.sendRedirect("login.jsp");
		} 
		
		if(session.getAttribute("account") != null) {
			
			Account account = (Account) session.getAttribute("account");
			
			out.println("Welcome " + account.getUsername() + "!");
		}
	%>
	
	<form action="deposit" method="post">
		How much would you like to deposit today?:
		<input type="text" name="depositAmount" placeholder="Enter Deposit Amount"><br><br>
		<input type="submit" value="Deposit"> 
	</form>

</body>
</html>