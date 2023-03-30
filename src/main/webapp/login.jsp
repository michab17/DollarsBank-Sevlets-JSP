<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login or Create Account</title>
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

	<h2>Login or Create Account</h2>
	
	<form action="login" method="post">
		<label for="username">Username:</label>
		<input type="text" name="username" id="username" placeholder="Enter your username"><br>
		<label for="pin">Pin:</label>
		<input type="password" name="pin" id="pin" placeholder="Enter your pin"><br>
		<input type="submit" value="Login"> 
	</form>

	<h3>or</h3>

	<form action="createAccount.jsp">
	    <input type="submit" value="Create Account" />
	</form>
</body>
</html>
