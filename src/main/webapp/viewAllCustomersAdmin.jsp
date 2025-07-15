<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.electricitymanagement.model.Customer" %>
<%@ page import="com.electricitymanagement.model.Users" %>
<%@ page session="true" %>
<% Users user = (Users) session.getAttribute("user"); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customers - EMS</title>
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

        .status-active {
            color: green;
            font-weight: bold;
        }

        .status-inactive {
            color: red;
            font-weight: bold;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        .btn-inactive {
            background-color: #d9534f;
        }

        .btn-inactive:hover {
            background-color: #c9302c;
        }

        .btn-active {
            background-color: #5cb85c;
        }

        .btn-active:hover {
            background-color: #449d44;
        }
    </style>
</head>
<body>

<jsp:include page="adminMenu.jsp" />

<div class="container">
    <h2>All Customers</h2>

    <div class="search-container">
        <form action="SearchCustomers" method="get">
            <input type="text" name="customerId" placeholder="Enter Consumer Number" required>
            <input type="submit" value="Search">
        </form>
    </div>

    <%
        List<Customer> customers = (List<Customer>) request.getAttribute("customers");
        if (customers == null || customers.isEmpty()) {
    %>
        <p>No customers found.</p>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>Consumer Number</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                for (Customer customer : customers) {
                    if ("admin".equalsIgnoreCase(customer.getName())) continue;
                    boolean isActive = "active".equalsIgnoreCase(customer.getStatus());
            %>
            <tr>
                <td><%= customer.getCustomerId() %></td>
                <td><%= customer.getName() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getAddress() %></td>
                <td class="<%= isActive ? "status-active" : "status-inactive" %>">
                    <%= customer.getStatus() %>
                </td>
                
                <td>
				    <form action="UpdateCustomerStatusAdmin" method="post" id="statusForm<%= customer.getCustomerId() %>">
				        <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">
				        <input type="hidden" name="newStatus" value="<%= isActive ? "Inactive" : "Active" %>">
				        <input type="button"
				               class="btn <%= isActive ? "btn-inactive" : "btn-active" %>"
				               value="Set <%= isActive ? "Inactive" : "Active" %>"
				               onclick="confirmStatusChange('Do you want to change the status?', this.form)">
				    </form>
				</td>
             
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

<script type="text/javascript">
    function confirmStatusChange(message, form) {
        if (confirm(message)) {
            form.submit();
        }
    }
</script>
