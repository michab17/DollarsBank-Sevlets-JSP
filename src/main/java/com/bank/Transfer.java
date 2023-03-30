package com.bank;

import java.io.IOException;

import com.bank.dao.AccountDao;
import com.bank.dao.TransactionDao;
//import com.bank.model.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class Transfer extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDao accountDao = new AccountDao();
		
		TransactionDao transDao = new TransactionDao();
		
		try {
		
			HttpSession session = request.getSession();
			
			String activeUsername = (String) session.getAttribute("username");

			Double amount = Double.parseDouble(request.getParameter("amount"));
			
			if(amount > 0 && amount < accountDao.getAvailableFunds(activeUsername)) {
			
				if(accountDao.deposit(request.getParameter("accountName"), amount) && accountDao.withdraw(activeUsername, amount)) {
					transDao.createTransaction("Transfer Out", "$" + amount + " was withdrawn from your account via transfer", accountDao.getAccountId(activeUsername));
					
					transDao.createTransaction("Transfer In", "$" + amount + " was deposited into your account via transfer", accountDao.getAccountId(request.getParameter("accountName")));
					
					response.sendRedirect("showAccount.jsp");
				} else {
					response.sendRedirect("fundsTransfer.jsp");
				}
		
			} else {
				response.sendRedirect("transferFunds.jsp");
			}
		} catch(Exception e) {
			response.sendRedirect("transferFunds.jsp");
		}
	}

}
