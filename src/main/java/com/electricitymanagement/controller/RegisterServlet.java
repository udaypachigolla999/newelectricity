package com.electricitymanagement.controller;

import com.electricitymanagement.model.Customer;
import com.electricitymanagement.model.Users;
import com.electricitymanagement.dao.UserDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
    	String customerId = req.getParameter("custid");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        

        try {
           
        	Customer cust=new Customer(customerId, name, email, mobile, address, "Active");
            
        	Users user = new Users(0, customerId, email, email, password, "Customer");
            
        	System.out.println("hii111");
        	
            boolean success = UserDao.registerCustomer(cust, user);
            if (success) {
            	System.out.println("Successfull");
                req.getRequestDispatcher("login.jsp").forward(req, res);
            } else {
            	System.out.println("ERROR");
                req.setAttribute("msg", "Email already exists!");
                req.getRequestDispatcher("register.jsp").forward(req, res);
            }

        } catch (Exception e) {
//            req.setAttribute("error", e.getMessage());
//            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
  }