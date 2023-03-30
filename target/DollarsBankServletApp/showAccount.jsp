<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

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

		<br>
		<br>
		Please click on your desired option!
		<br>
		<br>
		<form action="deposit.jsp">
		    <input type="submit" value="Make a Deposit" />
		</form>
		<br>
		<form action="withdraw.jsp">
		    <input type="submit" value="Make a Withdrawal" />
		</form>
		<br>
		<form action="fundsTransfer.jsp">
		    <input type="submit" value="Transfer Funds" />
		</form>
		<br>
		<form action="viewTransactions.jsp">
		    <input type="submit" value="View five most recent transactions" />
		</form>
		<br>
		<form action="displayInfo.jsp">
		    <input type="submit" value="Display your information" />
		</form>
		<br>
		<form action="logout">
		    <input type="submit" value="Logout" />
		</form>
</body>
</html>