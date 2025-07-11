package com.electricitymanagement.controller;

import com.electricitymanagement.dao.CustomerDao;
import com.electricitymanagement.dao.UserDao;
import com.electricitymanagement.model.Customer;
import com.electricitymanagement.model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
    	System.out.println("Inside profile");
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        Users user = (Users) req.getSession().getAttribute("user");

        Customer c=null;
		try {
			c = CustomerDao.getCustomerById(user.getCustomerId());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("Finished updating customer details");

        req.setAttribute("userProfile", c);
        req.getRequestDispatcher("profile.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        System.out.println("Inside profile post");
        if (session == null || session.getAttribute("user") == null) {
        	 System.out.println("failing profile post");
            res.sendRedirect("login.jsp");
            return;
        }

        
        
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");

        // Update user profile in the database
        try {
			int status=UserDao.updateUserProfile(email, name, mobile,address);
			if(status==0)
			{
				System.out.println("Error");
			}
			else
			{
				System.out.println("Successfully updated profile");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Redirect to the profile page after updating
        res.sendRedirect("view-bills");
    }
}