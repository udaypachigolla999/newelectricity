<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Electricity Bill Management - Login</title>
    
    <style> 
body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: Arial, sans-serif;
    background-color: #e8f0fe;
}

.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100%;
    text-align: center;
}

.header h1 {
    color: #0275d8;
    margin-bottom: 5px;
}

.header p {
    margin-top: 0;
    color: #555;
}

.form-container {
    background-color: #fff;
    padding: 25px 30px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    width: 300px;
}

.form-container h2 {
    margin-top: 0;
    margin-bottom: 20px;
    color: #0275d8;
}

.form-container input[type="email"],
.form-container input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

.form-container button {
    width: 100%;
    padding: 10px;
    background-color: #0275d8;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.form-container button:hover {
    background-color: #025aa5;
}

.register-link {
    margin-top: 15px;
    font-size: 14px;
}

.register-link a {
    color: #0275d8;
    text-decoration: none;
} </style>
    
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Electricity Bill Management</h1>
            <p>Manage your bills, payments and complaints efficiently</p>
        </div>
        <div class="form-container">
        <%
		    String msg2 = (String) session.getAttribute("msg2");
		    if (msg2 != null) {
		%>
		    <p style="color: red;"><%= msg2 %></p>
		<%
		        session.removeAttribute("msg2"); 
		    }
		%>
            <h2>Login to your Account</h2>
            <form method="post" action="login">
                <input type="email" name="email" placeholder="Enter your Email" required>
                <input type="password" name="password" placeholder="Enter your Password" required>
                <button type="submit">Login</button>
                <p class="register-link">Not registered yet? <a href="register.jsp">Register</a></p>
                <p class="register-link">Deactivated your account? <a href="restoreAccount.jsp">Restore Account</a></p> 
            </form>
        </div>
    </div>
</body>
</html>