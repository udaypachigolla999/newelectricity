package com.electricitymanagement.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electricitymanagement.dao.ComplaintDao;
import com.electricitymanagement.dao.UserDao;
import com.electricitymanagement.model.Complaint;
import com.electricitymanagement.model.Customer;
import com.electricitymanagement.model.Users;

/**
 * Servlet implementation class registerComplaint
 */
@WebServlet("/registerComplaint")
public class RegisterComplaint extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		
		
		
        String complaintType = req.getParameter("complaint-type");
        String description = req.getParameter("description");
        
        
        Users user = (Users) req.getSession().getAttribute("user");

        if (user == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        String customerId = user.getCustomerId(); 
        
        try {
           
        	Complaint comp = new Complaint(customerId,complaintType,description,"Open");
        	
            
        	System.out.println("In register complaint  hii111");
        	
            boolean success = ComplaintDao.registerComplaint(comp);
            
       
            if (success) {
            	System.out.println("Successfull");
            	res.setContentType("text/html");
            	PrintWriter out = res.getWriter();
            	out.println("<script type='text/javascript'>");
            	out.println("alert('Complaint Registered Successfull! Redirecting to View Complaints page...');");
            	out.println("window.location.href = 'view-complaints';");
            	out.println("</script>");
            	
            } else {
            	System.out.println("ERROR");
                
                req.getRequestDispatcher("registerComplaint.jsp").forward(req, res);
            }

        } catch (Exception e) {
//            req.setAttribute("error", e.getMessage());
//            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}