<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw</title>

		<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F0F0F0;
        }
        h2 {
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
        input[type=text], input[type=submit] {
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type=text]:hover {
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
	
	<form action="withdraw" method="post">
		How much would you like to withdraw today?:
		<input type="text" name="withdrawAmount" placeholder="Enter Withdrawal Amount"><br><br>
		<input type="submit" value="Withdraw"> 
	</form>

</body>
</html>