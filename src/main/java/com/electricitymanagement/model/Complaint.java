package com.electricitymanagement.model;

public class Complaint 
{
	
	private int complaintId;
	private String customerId;
	private String complaintType;
	private String description;
	private String status;   //open / resolved
	
	
	
	public Complaint(int complaintId, String customerId, String complaintType, String description, String status) {
		super();
		this.complaintId = complaintId;
		this.customerId = customerId;
		this.complaintType = complaintType;
		this.description = description;
		this.status = status;
	}

	public Complaint(String customerId, String complaintType, String description, String status) {
		super();
		
		this.complaintType = complaintType;
		this.customerId = customerId;
		this.description = description;
		this.status = status;
	}
	
	public int getComplaintId() {
		return complaintId;
	}
	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}
	public String getComplaintType() {
		return complaintType;
	}
	public void setComplaintType(String complaintType) {
		this.complaintType = complaintType;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}