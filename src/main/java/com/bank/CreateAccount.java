package com.bank;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.bank.dao.AccountDao;
import com.bank.dao.TransactionDao;
//import com.bank.model.Account;
import com.bank.model.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CreateAccount extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
				
		AccountDao accountDao = new AccountDao();
		
		TransactionDao transDao = new TransactionDao();
		
		try {
			String username = request.getParameter("username");
			String pin = request.getParameter("pin");
			Double availableFunds = Double.parseDouble(request.getParameter("availableFunds"));
			
			if(accountDao.createAccount(username, pin, availableFunds)) {
							
				transDao.createTransaction("Initial Deposit", "$" + availableFunds + " was deposited into your account", accountDao.getAccountId(username));
				
				session.setAttribute("username", username);
				session.setAttribute("pin", pin);
				
				response.sendRedirect("login.jsp");
			} else {
				response.sendRedirect("createAccount.jsp");
			}
			
		
		} catch(Exception e) {
			
			response.sendRedirect("createAccount.jsp");
			
		}
		
	}

}
