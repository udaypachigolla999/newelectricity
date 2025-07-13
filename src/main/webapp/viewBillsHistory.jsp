<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.List" %>
<%@ page import="com.electricitymanagement.model.Bill" %>
<%@ page import="com.electricitymanagement.model.Users" %>
<%@ page session="true" %>
<% Users user = (Users) session.getAttribute("user"); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Paid Bills - EMS</title>
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

        .modal {
        display: none; 
        position: fixed; 
        z-index: 1; 
        left: 0;
        top: 0;
        width: 100%; 
        height: 100%; 
        overflow: auto; 
        background-color: rgba(0, 0, 0, 0.7); 
        padding-top: 60px; 
    }

    .modal-content {
        background-color: #fff;
        margin: 5% auto; 
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        width: 80%; 
        max-width: 600px; 
        animation: fadeIn 0.3s; /* Animation for modal appearance */
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        transition: color 0.3s;
    }

    .close:hover,
    .close:focus {
        color: #ff0000; /* Change color on hover */
        text-decoration: none;
        cursor: pointer;
    }

    h2 {
        color: #0275d8; /* Header color */
        margin-top: 0;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
     .status-success {
            color: green;
            font-weight: bold;
        }

        .status-pending {
            color: red;
            font-weight: bold;
        }
   
    </style>
    <script>
        function showDetails(bill) {
            document.getElementById("modalContent").innerHTML = bill;
            document.getElementById("myModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }
    </script>
</head>
<body>

    <jsp:include page="menu.jsp" />
    <div class="container">
    <h2>Paid Bill Details</h2>

    <%
        List<Bill> bills = (List<Bill>) request.getAttribute("bills");
        if (bills == null || bills.isEmpty()) {
    %>
        <p>No bills found.</p>
    <%
        } else {
            boolean hasPaidBills = false;
    %>
        <table>
            <tr>
            	<th>Bill Id</th>
                <th>Amount</th>
                <!-- <th>Payment Date</th>
                <th>Payment Time</th> -->
                <th>Status</th>
                <th>View Details</th> 
            </tr>
            <%
                for (Bill bill : bills) {
                    if (bill.getStatus().equalsIgnoreCase("success")) {
                        hasPaidBills = true;
                        String status = bill.getStatus();
                        String statusClass = "status-pending";
                        if ("Success".equalsIgnoreCase(status)) {
                            statusClass = "status-success";
                        }
            %>
            <tr>
            	<td><%= bill.getBillId() %></td>
                <td>&#8377;<%= bill.getAmount() %></td>
                <%-- <td><%= bill.getPaymentDate() %></td>
                <td><%= bill.getPaymentTime() %></td> --%>
                <td class="<%= statusClass %>"><%= status %></td>
                <td>
                    <a href="javascript:void(0);" 
                       onclick="showDetails('Payment ID: <%= bill.getPaymentId() %><br>Amount: &#8377;<%= bill.getAmount() %><br>Status: <%= bill.getStatus() %><br>Payment Date: <%= bill.getPaymentDate() %><br>Payment Time: <%= bill.getPaymentTime() %>');">
                       View Details
                    </a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <%
            if (!hasPaidBills) {
        %>
            <p>No paid bills found.</p>
        <%
            }
        }
    %>
</div>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Bill Details</h2>
        <div id="modalContent" style="font-size: 16px; line-height: 1.5;"></div>
    </div>
</div>
    </body>
    </html>
