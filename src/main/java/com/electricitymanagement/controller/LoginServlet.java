package com.electricitymanagement.controller;

import com.electricitymanagement.dao.UserDao;
import com.electricitymanagement.model.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	System.out.println("Inside Login");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        
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
            Users user = UserDao.login(email, password);

            if (user == null) {
            	System.out.println("Invalid credentials");
            	req.getSession().setAttribute("msg2", "Invalid Credentials");
            	res.sendRedirect("login.jsp");

            }
//            else {
//            	req.getSession().setAttribute("user", user);
//                res.sendRedirect("view-bills");
//            }
            else if (user.getStatus() != null && user.getStatus().equalsIgnoreCase("Inactive")) {
                // ✅ Check if user is inactive
                System.out.println("User is inactive");
                req.getSession().setAttribute("msg2", "Your account is inactive");
                res.sendRedirect("login.jsp");
            } 
            else {
            	System.out.println("User is active");
            	req.getSession().setAttribute("user", user); 
            	req.getSession().setAttribute("username", user.getName());
            	
            	if (user.getRole().equalsIgnoreCase("Admin")) {
            	    req.getSession().setAttribute("role", "admin"); 
            	    res.sendRedirect("adminHome.jsp"); 
            	} 
            	else {
            	    req.getSession().setAttribute("role", "user");
            	    res.sendRedirect("home.jsp"); 
            	}
            }

            

        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}