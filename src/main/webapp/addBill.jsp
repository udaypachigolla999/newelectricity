<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<html>
<head>
    <title>Add Bill - Admin</title>
    <style>
		select {
		    width: 100%;
		    padding: 10px;
		    margin: 12px 0;
		    border: 1px solid #ccc;
		    border-radius: 6px;
		    font-size: 14px;
		}
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #1f3a93;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            background-color: #0275d8;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
        }

        .message {
            text-align: center;
            color: green;
        }

        .error {
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
<jsp:include page="adminMenu.jsp" />

<div class="container">
    <h2>Add New Bill</h2>

	<%
		// java.time.LocalDate today = java.time.LocalDate.of(2025, 3, 15);

	    java.time.LocalDate today = java.time.LocalDate.now();
	    java.time.format.DateTimeFormatter monthFormatter = java.time.format.DateTimeFormatter.ofPattern("MMMM");
	%>
	
    <form method="post" action="add-bill">
        <label>Consumer Number:</label>
        <input type="text" name="customerId" required>
        
        <label>Number of Units (₹5 per unit):</label>
		<input type="number" id="units" name="units" required oninput="calculateAmount()" min="0">
		
		<label>Amount (₹):</label>
		<input type="number" id="amount" name="amount" readonly>
        

       

		<label>Billing Month:</label>
    <select name="month" required>
    	<option value="" disabled selected>Select any month</option>
        <%
            for (int i = 0; i < 4; i++) {
                java.time.LocalDate pastMonth = today.minusMonths(i);
                String monthName = pastMonth.format(monthFormatter);
                int year = pastMonth.getYear();
        %>
            <option value="<%= monthName + "-" + year %>"><%= monthName + " " + year %></option>
        <%
            }
        %>
    </select>
        <button type="submit">Add Bill</button>
    </form>

    <%
        String msg = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");
        if (msg != null) {
    %>
        <p class="message"><%= msg %></p>
    <%
        } else if (error != null) {
    %>
        <p class="error"><%= error %></p>
    <%
        }
    %>
</div>

</body>
</html>

</body>
</html>

<script>
    function calculateAmount() {
        var units = document.getElementById("units").value;
        var rate = 5;
        var amount = 0;

        if (units !== "") {
            amount = parseFloat(units) * parseFloat(rate);
        }

        document.getElementById("amount").value = amount.toFixed(2);
    }
</script>
