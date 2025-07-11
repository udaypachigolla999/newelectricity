package com.electricitymanagement.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electricitymanagement.dao.BillDao;
import com.electricitymanagement.model.Bill;
import com.electricitymanagement.model.Users;

/**
 * Servlet implementation class SearchBillsServlet
 */
@WebServlet("/SearchBills")
public class SearchBillsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBillsServlet() {
        super();
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
            List<Bill> bills;
            if (customerId != null && !customerId.trim().isEmpty()) {
                bills = BillDao.getBillsByCustomerId(customerId);
            } else {
                bills = BillDao.getAllBills();
            }

            request.setAttribute("bills", bills);
            request.getRequestDispatcher("viewAllBillsAdmin.jsp").forward(request, response);
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