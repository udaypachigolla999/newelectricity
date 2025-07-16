package com.electricitymanagement.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electricitymanagement.dao.BillDao;

@WebServlet("/pay-bill")
public class PayBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String billId = req.getParameter("billId");
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println("IN Paybillservlet");
        
        try {
            boolean success = BillDao.markBillAsPaid(billId);
            if (success) {
                req.getSession().setAttribute("msg", "Bill paid successfully.");
            } else {
                req.getSession().setAttribute("msg", "Failed to pay bill.");
            }
            res.sendRedirect("view-billsHistory");

        } catch (Exception e) {
            req.setAttribute("error", "Error processing payment: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}