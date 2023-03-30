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

public class Deposit extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String activeUsername = (String) session.getAttribute("username");
		
		AccountDao accountDao = new AccountDao();
		
		TransactionDao transDao = new TransactionDao();
		
		try{
			Double transactionAmount = Double.parseDouble(request.getParameter("depositAmount"));
			
			if(transactionAmount > 0) {
				
				if(accountDao.deposit(activeUsername, transactionAmount)) {
					transDao.createTransaction("Deposit", "$" + transactionAmount + " was deposited into your account", accountDao.getAccountId(activeUsername));
					
					response.sendRedirect("showAccount.jsp");
				} else {
					response.sendRedirect("deposit.jsp");
				}

			} else {
				response.sendRedirect("deposit.jsp");
			}
		} catch(Exception e) {
			response.sendRedirect("deposit.jsp");

		}
		
	}

}
