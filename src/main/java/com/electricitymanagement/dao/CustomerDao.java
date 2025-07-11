package com.electricitymanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.electricitymanagement.model.Bill;
import com.electricitymanagement.model.Customer;

public class CustomerDao {
	public static List<Customer> getAllCustomers() throws Exception {
		DbUtility dbutil=new DbUtility();
		
		List<Customer> cList = new ArrayList<>();
		System.out.println("Inside Customer");
        try {
            Connection con = dbutil.createConnection(); 
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer");
            ResultSet rs = ps.executeQuery();
            System.out.println("Inside All customers final");
            while (rs.next()) {
            	Customer c = new Customer(rs.getString("customerId"), rs.getString("name"), rs.getString("email"), rs.getString("mobile"),rs.getString("address"),rs.getString("status"));
            	
                cList.add(c);
            }

            con.close();
        } catch (SQLException e) {
            e.printStackTrace(); 
            throw new Exception("Error fetching bills: " + e.getMessage());
        }

        return cList;
	}
	
	public static List<Customer> getCustomerByCustomerId(String customerId) throws Exception {
		DbUtility dbutil=new DbUtility();
		
		List<Customer> cList = new ArrayList<>();
		System.out.println("Inside Customer");
        try {
            Connection con = dbutil.createConnection(); 
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE customerId = ?");
            ps.setString(1, customerId);
            ResultSet rs = ps.executeQuery();
            System.out.println("Inside customer final");
            while (rs.next()) {
            	Customer c = new Customer(rs.getString("customerId"), rs.getString("name"), rs.getString("email"), rs.getString("mobile"),rs.getString("address"),rs.getString("status"));
            	
                cList.add(c);
            }

            con.close();
        } catch (SQLException e) {
            e.printStackTrace(); 
            throw new Exception("Error fetching customers: " + e.getMessage());
        }

        return cList;
	}
	
	public static void updateCustomerStatus(String customerId, String status) throws Exception {
	    DbUtility dbutil = new DbUtility();

	    try (Connection con = dbutil.createConnection()) {
	        PreparedStatement ps = con.prepareStatement("UPDATE customer SET status = ? WHERE customerId = ?");
	        ps.setString(1, status);
	        ps.setString(2, customerId);
	        int updated = ps.executeUpdate();
	        if (updated == 0) {
	            throw new Exception("No customer found with ID: " + customerId);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new Exception("Error updating customer status: " + e.getMessage());
	    }
	}
}