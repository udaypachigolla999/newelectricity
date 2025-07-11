package com.electricitymanagement.model;

public class Customer 
{
		private String customerId;
	 	private String name;
	    private String email;
	    private String mobile;
	    private String address;
	    private String status;
	    
	    
		public Customer() {
			
		}
		public Customer(String customerId, String name, String email, String mobile, String address, String status) {
			super();
			this.customerId = customerId;
			this.name = name;
			this.email = email;
			this.mobile = mobile;
			this.address = address;
			this.status = status;
		}
		public String getCustomerId() {
			return customerId;
		}
		public void setCustomerId(String customerId) {
			this.customerId = customerId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getMobile() {
			return mobile;
		}
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
	    
	   
}