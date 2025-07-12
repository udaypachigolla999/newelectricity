package com.electricitymanagement.controller;

import com.electricitymanagement.dao.BillDao;
import com.electricitymanagement.model.Bill;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.electricitymanagement.dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;

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
            	System.out.println("Successfull");
            	response.setContentType("text/html");
            	PrintWriter out = response.getWriter();
            	out.println("<script type='text/javascript'>");
            	out.println("alert('Bill added successfully! Redirecting to view bills page...');");
            	out.println("window.location.href = 'addBill.jsp';");
            	out.println("</script>");
            	
            } else {
            	System.out.println("ERROR");
            	request.setAttribute("msg", "Bill not added!");
                request.getRequestDispatcher("addBill.jsp").forward(request, response);
            }

        } catch (Exception e) {
//            req.setAttribute("error", e.getMessage());
//            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
  }
            
            
         