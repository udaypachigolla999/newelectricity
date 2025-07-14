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
			con=DriverManager.getConnection("jdbc:derby:C:\\Users\\2784823\\Desktop\\My Space\\Eclipse Workspace\\ElectricityManage\\DB2;create=true");
			
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

    public static int registerCustomer(Customer customer, Users user) throws Exception {
        System.out.println("HIi - Starting customer registration");

        Connection con = getConnection();

//		 1. Check if email already exists in login table
	      PreparedStatement check = con.prepareStatement("SELECT * FROM login WHERE email=?");
	      check.setString(1, user.getEmail());
	      ResultSet rs = check.executeQuery();
	      if (rs.next()) {
	          System.out.println("Hi - Email already exists");
	          return 1;
	      }
	      check = con.prepareStatement("SELECT * FROM login WHERE customerid=?");
	      check.setString(1, user.getCustomerId());
	      rs = check.executeQuery();
	      if (rs.next()) {
	          System.out.println("Hi - Consumer no. already exists");
	          return 2;
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
        	return 0;
        }
        return 3;
    }

    public static Users login(String email, String password) throws Exception {
    	System.out.println("Getting connection for login");
        Connection con = getConnection();

        PreparedStatement stmt = con.prepareStatement("SELECT l.*,c.status,c.name FROM login l left join customer c on l.customerId=c.customerId WHERE l.email=? AND password=?");
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        
        if (rs.next()) {
        	Users user=new Users(rs.getString("customerid"), rs.getInt("id"), rs.getString("email"), rs.getString("userName"), rs.getString("role"), rs.getString("status"),rs.getString("name"));
        	
            return user;
        } else {
            return null;
        }
    }
    
    public static boolean customerExists(String customerId) throws Exception {
        DbUtility dbutil = new DbUtility();
        try (Connection con = dbutil.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT 1 FROM customer WHERE customerId = ? and customerId not in(select customerid from login where role='admin' or role='Admin')")) {
            ps.setString(1, customerId);
            ResultSet rs = ps.executeQuery();
            
            return rs.next(); // returns true if customer exists
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error checking customer existence: " + e.getMessage());
        }
    }

	public static int updateUserProfile(String email, String name, String mobile, String address) throws Exception {
		
		
		// TODO Auto-generated method stub
		 DbUtility dbutil = new DbUtility();
	        try (Connection con = dbutil.createConnection();
	             PreparedStatement ps = con.prepareStatement("update customer set email=?,name=?,mobile=?,address=? WHERE email = ?")) {
	            ps.setString(1, email);
	            ps.setString(2, name);
	            ps.setString(3, mobile);
	            ps.setString(4, address);
	            ps.setString(5, email);
	            int rs = ps.executeUpdate();
	            if(rs>=1)
	            {
	            	return 1;
	            }
	            else
	            {
	            	return 0;
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new Exception("Error checking customer existence: " + e.getMessage());
	        }
		
		
	}
	 public static boolean restoreAccount(String email) {
	        boolean isRestored = false;
	        DbUtility dbutil = new DbUtility();
	        try {
	        	Connection connection = dbutil.createConnection();
	            String query = "UPDATE customer SET status = 'active' WHERE email = ? AND status = 'inactive'";
	            PreparedStatement statement = connection.prepareStatement(query);
	            statement.setString(1, email);
	            int rowsUpdated = statement.executeUpdate();
	            isRestored = (rowsUpdated > 0);
	            connection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return isRestored;
	    }

}