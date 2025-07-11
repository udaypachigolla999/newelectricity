package com.electricitymanagement.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtility {

	public Connection createConnection()
	{
		
		
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
	
	public void closeConnection(Connection con)
	{
		
		
		try
		{
		   con.close();
		}
		catch(SQLException ex)
		{
			
			
		}
		
		
		
		
	}

}