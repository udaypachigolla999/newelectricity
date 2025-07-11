<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f2ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .success-box {
            background-color: #ffffff;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .success-box h2 {
            color: #4CAF50;
        }
        .success-box a {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
        }
        .success-box a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="success-box">
        <h2>Registration/Login Successful!</h2>
        <p>Welcome to the Electricity Management System.</p>
        <a href="login.jsp">Go to Login</a>
    </div>
</body>
</html>