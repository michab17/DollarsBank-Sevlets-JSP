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

	Here is your account information:

	<%
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
	
		if(session.getAttribute("account") == null) {
			response.sendRedirect("login.jsp");
		} 
		
		if(session.getAttribute("account") != null) {
			
			Account account = (Account) session.getAttribute("account");
			
			out.print("User Id: " + account.getAccountId() + "\n\n");
			
			out.print("Username: " + account.getUsername() + "\n\n");
			
			out.print("Pin: " + account.getPin() + "\n\n");

			out.print("Available Funds: " + account.getAvailableFunds() + "\n\n");
		}
	%>
	
	<form action="showAccount.jsp">
		    <input type="submit" value="Back" />
	</form>

</body>
</html>