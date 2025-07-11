package com.electricitymanagement.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electricitymanagement.dao.ComplaintDao;
import com.electricitymanagement.dao.CustomerDao;
import com.electricitymanagement.model.Complaint;
import com.electricitymanagement.model.Customer;
import com.electricitymanagement.model.Users;

/**
 * Servlet implementation class SearchComplaintServlet
 */
@WebServlet("/SearchComplaintsServlet")
public class SearchComplaintsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchComplaintsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user = (Users) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String customerId = request.getParameter("customerId");

        try {
            List<Complaint> complaint;
            if (customerId != null && !customerId.trim().isEmpty()) {
                // Search for the customer by ID
            	complaint = ComplaintDao.getComplaintsByCustomerId(customerId);
            } else {
                // If no customer ID is provided, fetch all customers
            	complaint = ComplaintDao.getAllComplaints();
            }

            // Set the customers attribute to be used in the JSP
            request.setAttribute("complaints1", complaint);
            // Forward the request back to the viewAllCustomersAdmin.jsp page
            request.getRequestDispatcher("viewAllComplaintsAdmin.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}