package com.electricitymanagement.controller;

import com.electricitymanagement.dao.DbUtility;

public class dbmain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		DbUtility dbutil=new DbUtility();
		dbutil.createConnection();

	}

}
