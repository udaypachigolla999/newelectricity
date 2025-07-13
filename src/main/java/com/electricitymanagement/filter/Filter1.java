package com.electricitymanagement.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter(urlPatterns = {"/add-bill","/pay-bill","/profile","/registerComplaint","/SearchBills","/SearchComplaintsServlet","/SearchCustomers","/UpdateComplaintStatusServlet","/UpdateCustomerStatusAdmin","/viewAllComplaintsServlet","/ViewAllCustomers","/view-billsHistory","/view-bills", "/profile", "/registerComplaint.jsp", "/view-complaints","/addBill.jsp","/adminHome.jsp","/home.jsp","/menu.jsp","/payBills.jsp","/profile.jsp","/registerComplaint.jsp","/viewAllBillsAdmin.jsp","/viewAllComplaintsAdmin.jsp","/viewAllCustomersAdmin.jsp","/viewBills.jsp","/viewBillsHistory.jsp","/viewComplaints.jsp"})
public class Filter1 implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        System.out.println("Inside filter");
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        if (!loggedIn) {
            res.sendRedirect("login.jsp");
        } 
        else {
            // Prevent back button showing cached JSP
            res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            res.setHeader("Pragma", "no-cache");
            res.setDateHeader("Expires", 0);
            chain.doFilter(request, response);
        }
    }
}
