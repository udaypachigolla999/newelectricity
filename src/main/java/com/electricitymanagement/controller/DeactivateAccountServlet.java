package com.electricitymanagement.controller;

import com.electricitymanagement.dao.CustomerDao;
import com.electricitymanagement.dao.UserDao;
import com.electricitymanagement.model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeactivateAccountServlet")
public class DeactivateAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	System.out.println("\n Deactivatin \n");
    	 HttpSession session = req.getSession(false);
         if (session == null || session.getAttribute("user") == null) {
             res.sendRedirect("login.jsp");
             return;
         }

         Users user = (Users) req.getSession().getAttribute("user");

        if (session != null) {
            String customerId = user.getCustomerId();

            if (customerId != null) {
            	try
            	{
            		CustomerDao.updateCustomerStatus(customerId,"inactive");
            	}
            	catch(Exception e)
            	{
            		System.out.println(e.getMessage());
            	}
                

                // Invalidate session and redirect to LogoutServlet
				req.getRequestDispatcher("LogoutServlet").forward(req, res);
            }
        } else {
            res.sendRedirect("login.jsp");
        }
    }
}
