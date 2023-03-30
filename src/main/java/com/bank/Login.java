package com.bank;

import java.io.IOException;

import com.bank.dao.AccountDao;
//import com.bank.model.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String pin = request.getParameter("pin");
		
		AccountDao accountDao = new AccountDao();
		
		if(accountDao.checkCredentials(username, pin)) {
					
			HttpSession session = request.getSession();
			
			session.setAttribute("username", username);
			
			response.sendRedirect("showAccount.jsp");
		} else {
			response.sendRedirect("login.jsp");

		}
		
	}

}
