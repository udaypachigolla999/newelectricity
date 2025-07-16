<%@ page import="java.util.List" %>
<%@ page import="com.electricitymanagement.model.Bill" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>My Bills - EMS</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #e8f0fe;
        }

        .container {
            max-width: 800px;
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

        button {
            background-color: #0275d8;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .status-pending {
            color: red;
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

    <jsp:include page="menu.jsp" />

    <div class="container">
        <h2>My Pending Bills</h2>

        <%
            List<Bill> bills = (List<Bill>) request.getAttribute("bills");
            if (bills == null || bills.isEmpty()) {
        %>
            <p>No bills found.</p>
        <%
            } else {
                double totalUnpaidAmount = 0;
                List<Bill> unpaidBills = new java.util.ArrayList<>();
                for (Bill bill : bills) {
                    if ("Pending".equalsIgnoreCase(bill.getStatus())) {
                        unpaidBills.add(bill);
                        totalUnpaidAmount += bill.getAmount();
                    }
                }

                if (unpaidBills.isEmpty()) {
        %>
                    <p>All bills are paid.</p>
        <%
                } else {
        %>
            <form method="post" action="payBills.jsp">
                <table>
                    <tr>
                        <th>Bill ID</th>
                        <th>Billing Month</th>
                        <th>No. of Units</th> 
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                    <%
                        for (Bill bill : unpaidBills) {
                    %>
                    <tr>
                        <td><%= bill.getBillId() %></td>
                        <td><%= bill.getBillingMonthYear() %></td>
                        <td><%= (int)(bill.getAmount() / 5) %></td>
                        <td>&#8377;<%= bill.getAmount() %></td>
                        <td class="status-pending"><%= bill.getStatus() %></td>
                    </tr>
                    <input type="hidden" name="billIds" value="<%= bill.getBillId() %>" />
                    <%
                        }
                    %>
                    
                </table>
				
				<!-- Show Total Amount in a styled div -->
				<div style="margin-top: 20px; text-align: center;">
				    <h3 style="color: #0275d8;">Total Amount to Pay: &#8377;<%= totalUnpaidAmount %></h3>
				</div>
                
                <input type="hidden" name="amount" value="<%= totalUnpaidAmount %>">
                <div style="text-align: center;">
                    <button type="submit">Pay All Pending Bills</button>
                </div>
            </form>
        <%
                } // end of unpaidBills check
            }
        %>
    </div>
</body>
</html>
