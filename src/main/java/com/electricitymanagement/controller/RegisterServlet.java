package com.electricitymanagement.controller;

import com.electricitymanagement.model.Customer;
import com.electricitymanagement.model.Users;
import com.electricitymanagement.dao.UserDao;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
    	String customerId = req.getParameter("custid");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        
        System.out.println("PASS : "+password);
        String hashedPassword = null;
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            hashedPassword = hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
            // Optionally handle the error or redirect to an error page
        }
        
        password=hashedPassword;

        try {
           
        	Customer cust=new Customer(customerId, name, email, mobile, address, "Active");
            
        	Users user = new Users(0, customerId, email, email, password, "Customer");
            
        	System.out.println("hii111");
        	
            int success = UserDao.registerCustomer(cust, user);
            if (success==3) {
            	System.out.println("Successfull");
            	res.setContentType("text/html");
            	PrintWriter out = res.getWriter();
            	out.println("<script type='text/javascript'>");
            	out.println("alert('Registration successful! Redirecting to login page...');");
            	out.println("window.location.href = 'login.jsp';");
            	out.println("</script>");
            	
            } else if(success==1) {
            	System.out.println("ERROR");
            	req.getSession().setAttribute("msg2", "Email already exists!");
                res.sendRedirect("register.jsp");
            }
            else if(success==2) {
            	System.out.println("ERROR");
            	req.getSession().setAttribute("msg2", "Consumer No. already exists!");
            	res.sendRedirect("register.jsp");
            }
            

        } catch (Exception e) {
//            req.setAttribute("error", e.getMessage());
//            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
  }