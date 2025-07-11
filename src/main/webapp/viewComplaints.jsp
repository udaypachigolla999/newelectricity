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

        <%
            List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
            if (complaints == null || complaints.isEmpty()) {
        %>
            <p>No complaints found.</p>
        <%
            } else {
                boolean hasComplaints = false;
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
                        
                %>
                <tr>
                    <td><%= c.getComplaintId() %></td>
                    <td><%= c.getComplaintType() %></td>
                    <td><%= c.getDescription() %></td>
                    <td><%= c.getStatus() %></td>
                </tr>
                <%
                        
                    }
                %>
            </table>
            <%
                if (hasComplaints) {
            %>
                <p>No complaints found.</p>
            <%
                }
            }
        %>
    </div>
</body>
</html>