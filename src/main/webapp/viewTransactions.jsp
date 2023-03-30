<%@page import="com.bank.dao.AccountDao"%>
<%@page import="com.bank.dao.TransactionDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bank.model.Transaction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Transactions</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F0F0F0;
        }
        h2 {
            text-align: center;
            margin-top: 50px;
        }
        h3 {
            text-align: center;
            margin-top: 50px;
        }
        table {
            margin: 0 auto;
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #002F5D;
            color: #FFFFFF;
        }
                form {
            margin: 0 auto;
            width: 300px;
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        input[type=text], input[type=password], input[type=submit] {
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type=text]:hover, input[type=password]:hover {
            background-color: #F0F0F0;
        }
        input[type=submit] {
            font-weight: bold;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #002F5D;
        }
    </style>
</head>
<body>

	<h2> <%
	
		if(session.getAttribute("username") != null) {
			
			out.println("Welcome " + session.getAttribute("username") + "!");
		}
	
	%> </h2>
	
	<%
	
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");	
	
		if(session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		} 
		
		if(session.getAttribute("username") != null) {
			
			String activeUsername = (String) session.getAttribute("username");
			
			AccountDao accountDao = new AccountDao();
			
			TransactionDao transDao = new TransactionDao();
			
			int activeId = accountDao.getAccountId(activeUsername);
		
			ArrayList<Transaction> transactions = transDao.getTransactions(activeId);
			
			if(transactions.size() == 0) {
			    out.println("<p>No transactions found for this account.</p>");
			} else {
			    out.println("<table>");
			    out.println("<tr><th>Date</th><th>Description</th><th>Type</th><th>Amount</th></tr>");
			    for(Transaction transaction : transactions) {
			        out.println("<tr>");
			        out.println("<td>" + transaction.toString() + "</td>");
			        out.println("</tr>");
			    }
			    out.println("</table>");
			}
		}
	%>
	
	<form action="showAccount.jsp">
	    <input type="submit" value="Back" />
	</form>
	
</body>
</html>
