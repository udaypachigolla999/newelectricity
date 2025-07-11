package com.electricitymanagement.controller;

import com.electricitymanagement.dao.CustomerDao;
import com.electricitymanagement.model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateCustomerStatusAdmin")
public class UpdateCustomerStatusAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user = (Users) request.getSession().getAttribute("user");

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        String customerId = request.getParameter("customerId");
        String newStatus = request.getParameter("newStatus");

        try {
            CustomerDao.updateCustomerStatus(customerId, newStatus);
            response.sendRedirect("ViewAllCustomers"); // Refresh the list
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}