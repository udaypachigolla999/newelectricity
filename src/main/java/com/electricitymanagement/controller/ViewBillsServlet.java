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
 * Servlet implementation class BillsServlet
 */

@WebServlet("/view-bills")
public class ViewBillsServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("BILL SERVLET");
		
		Users user = (Users) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String customerId = user.getCustomerId(); // adjust this based on your Users model
            List<Bill> bills = BillDao.getBillsByCustomerId(customerId);
            String userName = BillDao.getUserNameByCustomerId(customerId);
            request.getSession().setAttribute("username", userName);
            System.out.println("USER             "+userName);
            request.setAttribute("bills", bills);
            request.getRequestDispatcher("viewBills.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}