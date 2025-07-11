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
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button[disabled] {
            background-color: #ccc;
            color: #666;
            cursor: not-allowed;
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
        <h2>My Bill Details</h2>

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
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <%
                    for (Bill bill : bills) {
                %>
                <tr>
                    <td><%= bill.getBillId() %></td>
                    <td>&#8377;<%= bill.getAmount() %></td>
                    <td><%= bill.getStatus() %></td>
                    <td>
                        <form method="post" action="payBills.jsp">
                            <input type="hidden" name="billId" value="<%= bill.getBillId() %>" />
                            <input type="hidden" name="amount" value="<%= bill.getAmount() %>">
                            <button type="submit" <%= bill.getStatus().equalsIgnoreCase("Success") ? "disabled" : "" %>>
                                Pay Bill
                            </button>
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