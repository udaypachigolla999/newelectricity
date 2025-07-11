package com.electricitymanagement.model;

public class Users 
{
	private int id;
	private String customerId;
	private String email;
	private String userName;
	private String password;
	private String role;
	
	private String status;
	
	public Users() {
		
	}
	public Users(int id, String customerId, String email, String userName, String password, String role) {
		super();
		this.id = id;
		this.customerId = customerId;
		this.email = email;
		this.userName = userName;
		this.password = password;
		this.role = role;
	}
	public Users(String customerId,int id, String email, String userName, String role, String status) {
		
		this.id = id;
		this.customerId = customerId;
		this.email = email;
		this.userName = userName;
		this.role = role;
		
		this.status=status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}