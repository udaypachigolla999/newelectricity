package com.electricitymanagement.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electricitymanagement.dao.BillDao;
import com.electricitymanagement.dao.ComplaintDao;
import com.electricitymanagement.model.Bill;
import com.electricitymanagement.model.Complaint;
import com.electricitymanagement.model.Users;

/**
 * Servlet implementation class viewComplaints
 */
@WebServlet("/view-complaints")
public class viewComplaints extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Complaint SERVLET");
		
		Users user = (Users) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String customerId = user.getCustomerId(); // adjust this based on your Users model
            List<Complaint> comps = ComplaintDao.getComplaintsByCustomerId(customerId);
            request.setAttribute("complaints", comps);
            request.getRequestDispatcher("viewComplaints.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
	}


}