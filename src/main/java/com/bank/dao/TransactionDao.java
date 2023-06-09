package com.bank.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

//import com.bank.model.Account;
import com.bank.model.Transaction;

public class TransactionDao {
	
	public void createTransaction(String type, String description, int accountId) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement st = conn.prepareStatement("INSERT INTO transaction(transactionType, transactionDescription, accountId) values (?, ?, ?)");
			st.setString(1, type);
			st.setString(2, description);
			st.setInt(3, accountId);
			
			st.execute();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public ArrayList<Transaction> getTransactions(int activeAccountId){
		
		ArrayList<Transaction> transactions = new ArrayList<Transaction>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM transaction where accountId = ? order by transactionTimestamp desc limit 5");
			ps.setInt(1, activeAccountId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Integer id = rs.getInt(1);
				String type = rs.getString(2);
				String description = rs.getString(3);
				Timestamp timestamp = rs.getTimestamp(4);
				Integer accountId = rs.getInt(5);
				
				transactions.add(new Transaction(type, description, timestamp, accountId));
			}
			
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return transactions;
		
	}
	
}
