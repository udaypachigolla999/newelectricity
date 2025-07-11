<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List" %>
<%@ page import="com.electricitymanagement.model.Complaint" %>
<%@ page import="com.electricitymanagement.model.Users" %>
<%@ page session="true" %>
<%
    Users user = (Users) session.getAttribute("user");
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints1");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View All Complaints - EMS</title>
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

        .search-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-container input[type="text"] {
            padding: 10px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .search-container input[type="submit"] {
            padding: 10px 15px;
            background-color: #0275d8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .status-open {
            color: green;
            font-weight: bold;
        }

        .status-close {
            color: red;
            font-weight: bold;
        }

        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        .btn-open {
            background-color: #28a745;
        }

        .btn-close {
            background-color: #dc3545;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

    <jsp:include page="adminMenu.jsp" />

    <div class="container">
        <h2>All Complaints Details</h2>

        <div class="search-container">
            <form action="SearchComplaintsServlet" method="get">
                <input type="text" name="customerId" placeholder="Enter Customer ID" required>
                <input type="submit" value="Search">
            </form>
        </div>

        <%
            if (complaints == null || complaints.isEmpty()) {
        %>
            <p>No complaints found.</p>
        <%
            } else {
        %>
            <table>
                <tr>
                    <th>Customer Id</th>
                    <th>Complaint Id</th>
                    <th>Complaint Type</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <% for (Complaint c : complaints) {
                       String statusClass = "open".equalsIgnoreCase(c.getStatus()) ? "status-open" : "status-close";
                %>
                <tr>
                    <td><%= c.getCustomerId() %></td>
                    <td><%= c.getComplaintId() %></td>
                    <td><%= c.getComplaintType() %></td>
                    <td><%= c.getDescription() %></td>
                    <td class="<%= statusClass %>"><%= c.getStatus() %></td>
                    <td>
                        <form action="UpdateComplaintStatusServlet" method="post">
                            <input type="hidden" name="complaintId" value="<%= c.getComplaintId() %>">
                            <input type="hidden" name="newStatus" value="<%= "open".equalsIgnoreCase(c.getStatus()) ? "close" : "open" %>">
                            <input type="submit" class="btn <%= "open".equalsIgnoreCase(c.getStatus()) ? "btn-close" : "btn-open" %>" 
                                   value=" <%= "open".equalsIgnoreCase(c.getStatus()) ? "Close" : "Open" %>">
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        <% } %>
    </div>
</body>
</html>