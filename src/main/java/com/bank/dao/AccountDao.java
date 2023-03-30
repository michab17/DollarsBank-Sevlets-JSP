package com.bank.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

//import com.bank.model.Account;
import com.bank.model.Transaction;

//import com.bank.model.Account;

public class AccountDao {
	
	public boolean checkCredentials(String username, String pin) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement st = conn.prepareStatement("SELECT * FROM account WHERE username = ? AND pin = ?");
			st.setString(1, username);
			st.setString(2, pin);
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				rs.close();
				st.close();
				conn.close();
				
				return true;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean createAccount(String username, String pin, Double availableFunds) {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement st = conn.prepareStatement("INSERT INTO account(username, pin, availableFunds) values (?, ?, ?)");
			st.setString(1, username);
			st.setString(2, pin);
			st.setDouble(3, availableFunds);
			
			st.execute();
			
			st.close();
			conn.close();
			
			return true;
		
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public boolean deposit(String username, Double amount)  {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement st = conn.prepareStatement("UPDATE account SET availableFunds = availableFunds + ? WHERE username = ?");
			st.setDouble(1, amount);
			st.setString(2, username);
			
			st.execute();
			
			st.close();
			conn.close();
			
			return true;
		
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean withdraw(String username, Double amount)  {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement st = conn.prepareStatement("UPDATE account SET availableFunds = availableFunds - ? WHERE username = ?");
			st.setDouble(1, amount);
			st.setString(2, username);
			
			st.execute();
			
			st.close();
			conn.close();
			
			return true;
		
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public int getAccountId(String username) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement ps = conn.prepareStatement("SELECT accountId FROM account WHERE username = ?");
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("accountId");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return 0;
	}
	
	public int getAvailableFunds(String username) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement ps = conn.prepareStatement("SELECT availableFunds FROM account WHERE username = ?");
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return (int) rs.getInt("availableFunds");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return 0;
	}
	
	public int getPin(String username) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			PreparedStatement ps = conn.prepareStatement("SELECT pin FROM account WHERE username = ?");
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("pin");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return 0;
	}
	
}
