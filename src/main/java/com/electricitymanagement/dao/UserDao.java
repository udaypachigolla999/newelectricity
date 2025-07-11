package com.electricitymanagement.dao;

import com.electricitymanagement.model.Bill;
import com.electricitymanagement.model.Customer;
import com.electricitymanagement.model.Users;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private static Connection getConnection() throws Exception {
    	Connection con=null;
		
		try
		{
			Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
			con=DriverManager.getConnection("jdbc:derby:E:\\eclipse-workspace\\TCS Project\\ElectricityManage\\DB2;create=true");
			
			System.out.println("Db Created");
		
		
		}
		
		
		catch(ClassNotFoundException ex)
		{
			
			ex.printStackTrace();
			
		}
		catch(SQLException ex1)
		{
			ex1.printStackTrace();
		}
		
		
		
		return con;
    }

    public static boolean registerCustomer(Customer customer, Users user) throws Exception {
        System.out.println("HIi - Starting customer registration");

        Connection con = getConnection();

//		 1. Check if email already exists in login table
	      PreparedStatement check = con.prepareStatement("SELECT * FROM login WHERE email=?");
	      check.setString(1, user.getEmail());
	      ResultSet rs = check.executeQuery();
	      if (rs.next()) {
	          System.out.println("Hi - Email already exists");
	          return false;
	      }

        // 2. Insert into customer table
        System.out.println("Starting customer insert");
		try {
			
			 PreparedStatement custStmt = con.prepareStatement("INSERT INTO customer VALUES (?, ?, ?, ?, ?, ?)");
		
		     custStmt.setString(1, customer.getCustomerId());
		     custStmt.setString(2, customer.getName());
		     custStmt.setString(3, customer.getEmail());
		     custStmt.setString(4, customer.getMobile());
		     custStmt.setString(5, customer.getAddress());
		     custStmt.setString(6, customer.getStatus());
		     
		     
		     System.out.println("Inprogress");
		     int rowsInserted = custStmt.executeUpdate();
		     System.out.println("Rows inserted: " + rowsInserted);
		
	
			System.out.println("customer success");
	
	
	
	        // 4. Insert into login table
	        PreparedStatement loginStmt = con.prepareStatement("INSERT INTO login (customerId,email,userName,password,role) VALUES ( ?, ?, ?, ?, ?)");
	
//	        loginStmt.setInt(1, user.getId());
	        loginStmt.setString(1, user.getCustomerId());
	        loginStmt.setString(2, user.getEmail());
	        loginStmt.setString(3, user.getEmail());
	        loginStmt.setString(4, user.getPassword());
	        loginStmt.setString(5, user.getRole());
	
	        loginStmt.executeUpdate();
	        
	        
	        System.out.println("login success");
	        
	
	        System.out.println("HIi - Registration complete");
	        
		}
        
        catch (Exception e) {
        	System.out.println(e.getMessage());
        	return false;
        }
        return true;
    }

    public static Users login(String email, String password) throws Exception {
    	System.out.println("Getting connection for login");
        Connection con = getConnection();

        PreparedStatement stmt = con.prepareStatement("SELECT l.*,c.status FROM login l left join customer c on l.customerId=c.customerId WHERE l.email=? AND password=?");
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        
        if (rs.next()) {
        	Users user=new Users(rs.getString("customerid"), rs.getInt("id"), rs.getString("email"), rs.getString("userName"), rs.getString("role"), rs.getString("status"));
        	
            return user;
        } else {
            return null;
        }
    }
    
    public static boolean customerExists(String customerId) throws Exception {
        DbUtility dbutil = new DbUtility();
        try (Connection con = dbutil.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT 1 FROM customer WHERE customerId = ?")) {
            ps.setString(1, customerId);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // returns true if customer exists
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error checking customer existence: " + e.getMessage());
        }
    }

	
}