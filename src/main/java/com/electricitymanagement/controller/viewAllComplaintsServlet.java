package com.electricitymanagement.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electricitymanagement.dao.ComplaintDao;
import com.electricitymanagement.model.Complaint;
import com.electricitymanagement.model.Users;

/**
 * Servlet implementation class viewAllComplaintsServlet
 */
@WebServlet("/viewAllComplaintsServlet")
public class viewAllComplaintsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println(" All Complaint SERVLET");
		
		Users user = (Users) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String customerId = user.getCustomerId(); // adjust this based on your Users model
            List<Complaint> comps = ComplaintDao.getAllComplaints();
            request.setAttribute("complaints1", comps);
            request.getRequestDispatcher("viewAllComplaintsAdmin.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
	}

}