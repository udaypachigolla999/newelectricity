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

@WebServlet("/view-billsHistory")
public class ViewBillsHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewBillsHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("BILL SERVLET");
		
		Users user = (Users) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        if(user.getRole().equalsIgnoreCase("admin")) {
        	try {
        	List<Bill> bills = BillDao.getAllBills();
        	request.setAttribute("bills", bills);
            request.getRequestDispatcher("viewAllBillsAdmin.jsp").forward(request, response);
        	} catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
        else {
        	try {
                String customerId = user.getCustomerId(); 
                List<Bill> bills = BillDao.getBillsByCustomerId(customerId);
                String userName = BillDao.getUserNameByCustomerId(customerId);
                System.out.println("username      "+ userName);
                request.getSession().setAttribute("username", userName);
                request.setAttribute("bills", bills);
                request.getRequestDispatcher("viewBillsHistory.jsp").forward(request, response);

            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
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