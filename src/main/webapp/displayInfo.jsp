<%@page import="com.bank.dao.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Information</title>
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
        .user-info {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin: 20px;
            background-color: #fff;
        }
        .user-info span {
            display: block;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h2>Account Information</h2>
    <%
        AccountDao accountDao = new AccountDao();
        String activeUsername = (String) session.getAttribute("username");
        if(activeUsername == null) {
            response.sendRedirect("login.jsp");
        } else {
            int accountId = accountDao.getAccountId(activeUsername);
            String username = activeUsername;
            int pin = accountDao.getPin(activeUsername);
            double availableFunds = accountDao.getAvailableFunds(activeUsername);
    %>
    <div class="user-info">
        <span>User Id: <%=accountId%></span>
        <span>Username: <%=username%></span>
        <span>Pin: <%=pin%></span>
        <span>Available Funds: $<%=availableFunds%></span>
    </div>
    <% } %>
    <form action="showAccount.jsp">
        <input type="submit" value="Back" />
    </form>
</body>
</html>
