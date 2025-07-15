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
        @keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}
        
    </style>
</head>
<body>

    <!-- Navbar -->
    <jsp:include page="adminMenu.jsp" />

    <!-- Main Content -->
    <div class="container">
        <h2>All Bills</h2>

        <!-- Search Form -->
        <div class="search-container">
            <form action="SearchBills" method="get">
                <input type="text" name="customerId" placeholder="Enter Consumer Number" required>
                <input type="submit" value="Search">
            </form>
        </div>

        <%
            List<Bill> bills = (List<Bill>) request.getAttribute("bills");
            if (bills == null || bills.isEmpty()) {
        %>
            <p>No bills found.</p>
        <%
            } else {
        %>
            <table>
                <tr>
                    <th>Bill ID</th>
                    <th>Consumer Number</th> 
                    <!-- <th>Payment Id</th> -->
                    <th>Amount</th>
                    <th>Status</th>
                    <!-- <th>Payment Date</th>
                    <th>Payment Time</th> -->
                    <th>View Details</th>
                    
                </tr>
                <%
                    for (Bill bill : bills) {
                %>
                <tr>
                    <td><%= bill.getBillId() %></td>
                    <td><%= bill.getCustomerId() %></td> 
                    <%-- <td><%= bill.getPaymentId() %></td> --%>
                    <td>&#8377;<%= bill.getAmount() %></td>
                    <td style="color: <%= bill.getStatus().equalsIgnoreCase("Pending") ? "red" : "green" %>;">
					    <%= bill.getStatus() %>
					</td>
                    <%-- <td><%= bill.getPaymentDate() %></td>
                    <td><%= bill.getPaymentTime() %></td> --%>
                    <td>
					    <a href="javascript:void(0);" 
					       onclick="showDetails('<%= 
					           "Bill ID: " + bill.getBillId() + "<br>" +
					           "Consumer No: " + bill.getCustomerId() + "<br>" +
					           (bill.getPaymentId() != null ? "Payment ID: " + bill.getPaymentId() + "<br>" : "") +
					           "Amount: &#8377;" + bill.getAmount() + "<br>" +
					           "Status: " + bill.getStatus() + "<br>" +
					           (bill.getPaymentDate() != null ? "Payment Date: " + bill.getPaymentDate() + "<br>" : "") +
					           (bill.getPaymentTime() != null ? "Payment Time: " + bill.getPaymentTime() : "")
					       %>');">
					        View Details
					    </a>
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
    
<div id="myModal" class="modal" style="display:none; position:fixed; z-index:1; left:0; top:0; width:100%; height:100%; overflow:auto; background-color: rgba(0,0,0,0.7); padding-top:60px;">
    <div class="modal-content" style="background-color:#fff; margin:5% auto; padding:20px; border-radius:8px; box-shadow:0 4px 20px rgba(0,0,0,0.3); width:80%; max-width:600px; animation: fadeIn 0.3s;">
        <span class="close" onclick="closeModal()" style="color:#aaa; float:right; font-size:28px; font-weight:bold; cursor:pointer;">&times;</span>
        <h2 style="color:#0275d8;">Bill Details</h2>
        <div id="modalContent" style="font-size: 16px; line-height: 1.5;"></div>
    </div>
</div>
    
 
 <script>
    function showDetails(bill) {
        document.getElementById("modalContent").innerHTML = bill;
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }
</script>
 
</body>
</html>