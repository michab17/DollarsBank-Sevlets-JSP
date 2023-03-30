package com.bank;

import java.io.IOException;

import com.bank.dao.AccountDao;
import com.bank.dao.TransactionDao;
//import com.bank.model.Account;
import com.bank.model.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Withdraw extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		TransactionDao transDao = new TransactionDao();
		
		AccountDao accountDao = new AccountDao();
		
		String activeUsername = (String) session.getAttribute("username");
		
		try {
			Double transactionAmount = Double.parseDouble(request.getParameter("withdrawAmount"));
			
			if(transactionAmount > 0 && transactionAmount < accountDao.getAvailableFunds(activeUsername)) {

				if(accountDao.withdraw(activeUsername, transactionAmount)) {
				
					transDao.createTransaction("Withdraw", "$" + transactionAmount + " was withdrawn from your account", accountDao.getAccountId(activeUsername));
					
					response.sendRedirect("showAccount.jsp");
				} else {
					response.sendRedirect("withdraw.jsp");
				}
				
			} else {
				response.sendRedirect("withdraw.jsp");
			}
		} catch(Exception e) {
			response.sendRedirect("withdraw.jsp");

		}
	}

}
