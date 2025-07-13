package com.electricitymanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.electricitymanagement.model.Bill;
import com.electricitymanagement.model.Complaint;
import com.electricitymanagement.model.Customer;
import com.electricitymanagement.model.Users;

public class ComplaintDao 
{

	public static boolean registerComplaint(Complaint comp) throws Exception {
        System.out.println("HIi - Starting complaint registration");
        
        DbUtility dbutil=new DbUtility();
		
		try 
		{
			Connection con = dbutil.createConnection(); 

			
			 PreparedStatement compStmt = con.prepareStatement("INSERT INTO Complaint (customerId,complaintType,description,status) VALUES ( ?, ?, ?, ?)");
				
			 compStmt.setString(1, comp.getCustomerId());
			 compStmt.setString(2, comp.getComplaintType());
			 compStmt.setString(3, comp.getDescription());
			 compStmt.setString(4, comp.getStatus());
			
			 compStmt.executeUpdate();
		}
		catch (Exception e) {
	        	System.out.println(e.getMessage());
	        	return false;
	    }
        
        System.out.println("HIi - complaint registration  successful");
	        
		
        return true;
    }

	public static List<Complaint> getComplaintsByCustomerId(String customerId) throws Exception 
	{
		DbUtility dbutil=new DbUtility();
		
		List<Complaint> compList = new ArrayList<>();
		System.out.println("Inside Complaint");
        try {
            Connection con = dbutil.createConnection(); // use your existing method
            PreparedStatement ps = con.prepareStatement("SELECT * FROM complaint WHERE customerId = ? order by complaintId desc");
            ps.setString(1, customerId);
            ResultSet rs = ps.executeQuery();
            System.out.println("Inside Complaint final");


            while (rs.next()) {
            	Complaint b=new Complaint(rs.getInt("complaintId"), rs.getString("customerId"), rs.getString("complaintType"), rs.getString("description"),rs.getString("status"));
               
                compList.add(b);
            }

            con.close();
        } catch (SQLException e) {
            e.printStackTrace(); // also log this
            throw new Exception("Error fetching bills: " + e.getMessage());
        }

        return compList;
	}

	public static List<Complaint> getAllComplaints() throws Exception {
		
		DbUtility dbutil=new DbUtility();
		
		List<Complaint> compList = new ArrayList<>();
		System.out.println("Inside All Complaint");
        try {
            Connection con = dbutil.createConnection(); // use your existing method
            PreparedStatement ps = con.prepareStatement("SELECT * FROM complaint order by complaintId desc");
            ResultSet rs = ps.executeQuery();
            System.out.println("Inside All Complaint final");


            while (rs.next()) {
            	Complaint b=new Complaint(rs.getInt("complaintId"), rs.getString("customerId"), rs.getString("complaintType"), rs.getString("description"),rs.getString("status"));
               
                compList.add(b);
            }

            con.close();
        } catch (SQLException e) {
            e.printStackTrace(); // also log this
            throw new Exception("Error fetching bills: " + e.getMessage());
        }

        return compList;
	}

	

		public static boolean updateComplaintStatus(int complaintId, String newStatus) throws Exception {
			    DbUtility dbutil = new DbUtility();
			    try (Connection con = dbutil.createConnection()) {
			        PreparedStatement ps = con.prepareStatement("UPDATE complaint SET status = ? WHERE complaintId = ?");
			        ps.setString(1, newStatus);
			        ps.setInt(2, complaintId);
			        int updated = ps.executeUpdate();
			        return updated > 0;
			    } catch (SQLException e) {
			        throw new Exception("Failed to update complaint status: " + e.getMessage());
			    }
		}
		
	


			public static Complaint getComplaintById(int complaintId) throws Exception {
					    DbUtility dbutil = new DbUtility();
					    Complaint complaint = null;

					    try (Connection con = dbutil.createConnection()) {
					        PreparedStatement ps = con.prepareStatement("SELECT * FROM complaint WHERE complaintId = ?");
					        ps.setInt(1, complaintId);
					        ResultSet rs = ps.executeQuery();

					        if (rs.next()) {
					            complaint = new Complaint(
					                rs.getInt("complaintId"),
					                rs.getString("customerId"),
					                rs.getString("complaintType"),
					                rs.getString("description"),
					                rs.getString("status")
					            );
					        }

					    } catch (SQLException e) {
					        e.printStackTrace();
					        throw new Exception("Error fetching complaint: " + e.getMessage());
					    }

					    return complaint;
					}
		
	
	
   }