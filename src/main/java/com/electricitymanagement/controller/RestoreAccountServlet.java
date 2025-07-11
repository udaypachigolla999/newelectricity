package com.electricitymanagement.controller;

import com.electricitymanagement.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/restoreAccount")
public class RestoreAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println("inside restore");

        try {
            boolean isRestored = UserDao.restoreAccount(email);
            System.out.println(email);
            if (isRestored) {
                request.getSession().setAttribute("msg2", "Account restored successfully! You can now log in.");
            } else {
                request.getSession().setAttribute("msg2", "Failed to restore account. Please check your email.");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msg2", "Error: " + e.getMessage());
        }

        response.sendRedirect("login.jsp"); 
    }
}