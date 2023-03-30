<%@ page import="jakarta.servlet.http.HttpServletRequest" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="createAccount" method="post">
		Username:
		<input type="text" name="username" placeholder="Enter Desired Username"><br><br>
		Pin:
		<input type="password" name="pin" placeholder="Enter Desired Pin"><br><br>
		Starting Balance:
		<input type="text" name="availableFunds" placeholder="Enter Initial Deposit Amount"><br><br>
		<input type="submit" value="Create Account"> 
	</form>
	<br>
	
</body>
</html>