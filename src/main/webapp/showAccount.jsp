<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>

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
		
	%>

		<br>
		<br>
		<h2> Please click on your desired option! </h2>
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