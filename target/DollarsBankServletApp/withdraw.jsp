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
	
	<form action="withdraw" method="post">
		How much would you like to withdraw today?:
		<input type="text" name="withdrawAmount" placeholder="Enter Withdrawal Amount"><br><br>
		<input type="submit" value="Withdraw"> 
	</form>

</body>
</html>