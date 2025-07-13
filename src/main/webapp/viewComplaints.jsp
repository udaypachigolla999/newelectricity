<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.electricitymanagement.model.Complaint" %>
<%@ page import="com.electricitymanagement.model.Users" %>
<%@ page session="true" %>
<% Users user = (Users) session.getAttribute("user"); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Complaints - EMS</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #e8f0fe;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #0275d8;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #0275d8;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .status-open {
            color: red;
            font-weight: bold;
        }

        .status-close {
            color: green;
            font-weight: bold;
        }

        p {
            text-align: center;
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <jsp:include page="menu.jsp" />

    <!-- Main Content -->
  

<div class="container">
        <h2>View Complaints Details</h2>
        <div class="search-container" style="text-align: center; margin-bottom: 20px;">
    <form action="view-complaints" method="get">
        <input type="text" name="complaintId" placeholder="Enter Complaint ID" required
               style="padding: 10px; width: 200px; border-radius: 5px; border: 1px solid #ccc;">
        <input type="submit" value="Search"
               style="padding: 10px 15px; background-color: #0275d8; color: white; border: none; border-radius: 5px; cursor: pointer;">
    </form>
</div>
        <%
            List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
            if (complaints == null || complaints.isEmpty()) {
        %>
            <p>No complaints found.</p>
        <%
            } else {
        %>
            <table>
                <tr>
                    <th>Complaint Id</th>
                    <th>Complaint Type</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
                <%
                    for (Complaint c : complaints) {
                        String status = c.getStatus();
                        String statusClass = "status-open";
                        if ("Close".equalsIgnoreCase(status)) {
                            statusClass = "status-close";
                        }
                %>
                <tr>
                    <td><%= c.getComplaintId() %></td>
                    <td><%= c.getComplaintType() %></td>
                    <td><%= c.getDescription() %></td>
                    <td class="<%= statusClass %>"><%= status %></td>
                </tr>
                <%
                    }
                %>
            </table>
        <%
            }
        %>
    </div>
</body>
</html>