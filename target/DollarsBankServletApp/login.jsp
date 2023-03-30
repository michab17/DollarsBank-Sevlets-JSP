<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<html>
<body>
	<h2>Login or Create Account</h2>
	
	<form action="login" method="post">
		Username:
		<input type="text" name="username" placeholder="Enter your username"><br><br>
		Pin:
		<input type="password" name="pin" placeholder="Enter your pin"><br><br>
		<input type="submit" value="Login"> 
	</form>
	<br>
	__________________________________________
	
	<br>
	<br>
	<br>
	
	<form action="createAccount.jsp">
		    <input type="submit" value="Create Account" />
		</form>
</body>
</html>
