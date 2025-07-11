package com.electricitymanagement.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.electricitymanagement.model.Bill;

public class BillDao 
{
	public static List<Bill> getBillsByCustomerId(String customerId) throws Exception {
		DbUtility dbutil=new DbUtility();
		
		List<Bill> billList = new ArrayList<>();
		System.out.println("Inside BIll");
        try {
            Connection con = dbutil.createConnection(); 
            PreparedStatement ps = con.prepareStatement("SELECT * FROM bill WHERE customerId = ? order by billid desc");
            ps.setString(1, customerId);
            ResultSet rs = ps.executeQuery();
            System.out.println("Inside BIll final");
            System.out.println("Searching for bills with Customer ID: " + customerId);

            while (rs.next()) {
            	Bill b=new Bill(rs.getInt("billId"), rs.getString("customerId"), rs.getDouble("amount"), rs.getString("status"), rs.getString("paymentId"),rs.getDate("paymentDate"),rs.getTime("paymentTime"));
            	
                billList.add(b);
            }

            con.close();
        } catch (SQLException e) {
            e.printStackTrace(); 
            throw new Exception("Error fetching bills: " + e.getMessage());
        }

        return billList;
	}
	public static List<Bill> getAllBills() throws Exception {
		DbUtility dbutil=new DbUtility();
		
		List<Bill> billList = new ArrayList<>();
		System.out.println("Inside BIll");
        try {
            Connection con = dbutil.createConnection(); 
            PreparedStatement ps = con.prepareStatement("SELECT b.*,c.name FROM bill b left join customer c on b.customerId=c.customerId order by billid desc");
            ResultSet rs = ps.executeQuery();
            System.out.println("Inside All BIll final");
            while (rs.next()) {
            	Bill b=new Bill(rs.getInt("billId"), rs.getString("customerId"), rs.getDouble("amount"), rs.getString("status"), rs.getString("paymentId"),rs.getDate("paymentDate"),rs.getTime("paymentTime"));
            	
                billList.add(b);
            }

            con.close();
        } catch (SQLException e) {
            e.printStackTrace(); 
            throw new Exception("Error fetching bills: " + e.getMessage());
        }

        return billList;
	}
	public static boolean markBillAsPaid(String billId) throws Exception {
		DbUtility dbutil=new DbUtility();
		LocalDate currentDate = LocalDate.now();
		LocalTime currentTime = LocalTime.now();
	    try {
	        Connection con = dbutil.createConnection();
	        PreparedStatement ps = con.prepareStatement("UPDATE bill SET status = 'Success', paymentDate = ?, paymentTime = ?, paymentId = ? WHERE billId = ?");
	        ps.setDate(1,Date.valueOf(currentDate));
	        ps.setTime(2,Time.valueOf(currentTime));
	        ps.setString(3,"PAY" + UUID.randomUUID().toString().replace("-", "").substring(0, 10).toUpperCase());
	        ps.setString(4, billId);
	        int rows = ps.executeUpdate();
	        ps.close();
	        con.close();
	        return rows > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new Exception("Unable to update bill status: " + e.getMessage());
	    }
	}
	public static String getUserNameByCustomerId(String customerId) throws Exception 
	{
		
		DbUtility dbutil=new DbUtility();
		try {
	        Connection con = dbutil.createConnection();
	        PreparedStatement ps = con.prepareStatement("select name from Customer where customerId=?");
	        ps.setString(1,customerId);
	        ResultSet rs = ps.executeQuery();
	        if(rs.next())
	        {
	        	return rs.getString("name");
	        }
	        
	        return "";
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new Exception("Unable to get the user name: " + e.getMessage());
	    }
	}

	public static boolean addBill(Bill bill) throws Exception {
	    DbUtility dbutil = new DbUtility();
	    try {
	        Connection con = dbutil.createConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "INSERT INTO bill (customerId, amount, status, paymentId, paymentDate, paymentTime) VALUES (?, ?, ?, ?, ?, ?)"
	        );
	        ps.setString(1, bill.getCustomerId());
	        ps.setDouble(2, bill.getAmount());
	        ps.setString(3, bill.getStatus());
	        ps.setString(4, bill.getPaymentId()); // null
	        ps.setDate(5, bill.getPaymentDate()); // null
	        ps.setTime(6, bill.getPaymentTime()); // null

	        int rows = ps.executeUpdate();
	        ps.close();
	        con.close();

	        return rows > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new Exception("Error adding bill: " + e.getMessage());
	    }
	}
	
	

              }

