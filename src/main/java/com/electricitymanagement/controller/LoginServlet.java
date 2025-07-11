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
            	
            	if (user.getRole().equalsIgnoreCase("Admin")) {
            	    req.getSession().setAttribute("role", "admin"); 
            	    res.sendRedirect("addBill.jsp"); 
            	} 
            	else {
            	    req.getSession().setAttribute("role", "user");
            	    res.sendRedirect("view-bills"); 
            	}
            }

            

        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}