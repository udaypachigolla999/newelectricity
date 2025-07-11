

package com.electricitymanagement.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electricitymanagement.dao.ComplaintDao;

/**
 * Servlet implementation class UpdateComplaintStatusServlet
 */
@WebServlet("/UpdateComplaintStatusServlet")
public class UpdateComplaintStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String complaintIdStr = request.getParameter("complaintId");
        String newStatus = request.getParameter("newStatus");

        try {
            int complaintId = Integer.parseInt(complaintIdStr);
            ComplaintDao.updateComplaintStatus(complaintId, newStatus);
            response.sendRedirect("viewAllComplaintsServlet"); 
        } catch (Exception e) {
            request.setAttribute("error", "Error updating status: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}