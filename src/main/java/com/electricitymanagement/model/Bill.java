package com.electricitymanagement.model;

import java.sql.Date;
import java.sql.Time;

public class Bill 
{
	private int billId;
	private String customerId;
	private double amount;
	private String status;
	private String paymentId; //randomly generated 
	private Date paymentDate; 
	private Time paymentTime; 
	
	private String billingMonthYear;
	
	
	
	
	

	public Bill(int billId, String customerId, double amount, String status, String paymentId, Date date,
			Time time) {
		this.billId = billId;
		this.customerId = customerId;
		this.amount = amount;
		this.status = status;
		this.paymentId = paymentId;
		this.paymentDate = date;
		this.paymentTime = time;
	}

	

	public Bill(String customerId, double amount, String status, String paymentId, Date date,
			Time time) {
		
		this.customerId = customerId;
		this.amount = amount;
		this.status = status;
		this.paymentId = paymentId;
		this.paymentDate = date;
		this.paymentTime = time;
	}



	public int getBillId() {
		return billId;
	}
	public void setBillId(int billId) {
		this.billId = billId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	
	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Time getPaymentTime() {
		return paymentTime;
	}

	public void setPaymentTime(Time paymentTime) {
		this.paymentTime = paymentTime;
	}
	
	public String getBillingMonthYear() {
	    return billingMonthYear;
	}

	public void setBillingMonthYear(String billingMonthYear) {
	    this.billingMonthYear = billingMonthYear;
	}
	
	
	
	

}