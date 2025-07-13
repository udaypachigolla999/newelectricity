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

    <form method="post" action="add-bill">
        <label>Customer Number:</label>
        <input type="text" name="customerId" required>

        <label>Amount:</label>
        <input type="number" name="amount" step="0.01" required>

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