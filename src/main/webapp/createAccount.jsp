<%@ page import="jakarta.servlet.http.HttpServletRequest" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>

	<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F0F0F0;
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