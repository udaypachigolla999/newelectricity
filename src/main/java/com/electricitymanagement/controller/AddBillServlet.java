package com.electricitymanagement.controller;

import com.electricitymanagement.dao.BillDao;
import com.electricitymanagement.model.Bill;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.electricitymanagement.dao.UserDao;
import java.io.IOException;

@WebServlet("/add-bill")
public class AddBillServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerId = request.getParameter("customerId");
        String amountStr = request.getParameter("amount");

        try {
            if (!UserDao.customerExists(customerId)) {
                request.setAttribute("error", "Customer does not exist with that ID.");
                request.getRequestDispatcher("addBill.jsp").forward(request, response);
                return;
            }

            double amount = Double.parseDouble(amountStr);

            // Create bill with status Pending
            Bill bill = new Bill(customerId, amount, "Pending", null, null, null);

            boolean success = BillDao.addBill(bill);

            if (success) {
                request.setAttribute("message", "Bill added successfully.");
            } else {
                request.setAttribute("error", "Failed to add bill.");
            }

        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            e.printStackTrace();
        }

        request.getRequestDispatcher("addBill.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addBill.jsp").forward(request, response);
    }
}