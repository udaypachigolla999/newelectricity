package com.electricitymanagement.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.electricitymanagement.dao.BillDao;
import com.electricitymanagement.dao.CustomerDao;
import com.electricitymanagement.model.Bill;
import com.electricitymanagement.model.Customer;
import com.electricitymanagement.model.Users;

/**
 * Servlet implementation class ViewAllCustomers
 */
@WebServlet("/ViewAllCustomers")
public class ViewAllCustomers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAllCustomers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Customer SERVLET");
		
		Users user = (Users) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        if(user.getRole().equalsIgnoreCase("admin")) {
        	try {
        	List<Customer> customers = CustomerDao.getAllCustomers();
        	request.setAttribute("customers", customers);
            request.getRequestDispatcher("viewAllCustomersAdmin.jsp").forward(request, response);
        	} catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
        else {
        	try {
                String customerId = user.getCustomerId(); 
                List<Customer> customers = CustomerDao.getCustomerByCustomerId(customerId);
                request.setAttribute("customers", customers);
                request.getRequestDispatcher("viewCustomerHistory.jsp").forward(request, response);

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