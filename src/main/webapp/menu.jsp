<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<style>
body {
    margin: 0;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #1f3a93;
    padding: 10px 20px;
    color: white;
}

.nav-left, .nav-right {
    display: flex;
    align-items: center;
}

.nav-left .dropdown {
    position: relative;
    margin-right: 20px;
}

.dropdown button {
    background-color: transparent;
    color: white;
    border: none;
    padding: 10px;
    font-size: 16px;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 4px;
}

.arrow {
    font-size: 12px;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    color: black;
    min-width: 180px;
    box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    z-index: 1;
    border-radius: 6px;
    padding: 6px 0;
}

.dropdown-content a {
    padding: 12px 18px;
    text-decoration: none;
    display: block;
    color: #333;
    font-size: 15px;
    border-radius: 4px;
    transition: background-color 0.3s, color 0.3s;
}

.dropdown-content a:hover {
    background-color: #e6f0ff;
    color: #1f3a93;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.nav-right span {
    margin-right: 15px;
    font-weight: bold;
}

.logout-btn {
    background-color: #f44336;
    color: white;
    border: none;
    padding: 8px 12px;
    border-radius: 5px;
    cursor: pointer;
}
</style>
</head>
<body>
<div class="navbar">
    <div class="nav-left">
        <div class="dropdown">
            <button>Bills <span class="arrow">▼</span></button>
            <div class="dropdown-content">
                <a href="view-bills">Pay Bills</a>
                <a href="view-billsHistory">View Bill History</a>
            </div>
        </div>
        <div class="dropdown">
            <button>Complaint <span class="arrow">▼</span></button>
            <div class="dropdown-content">
                <a href="registerComplaint.jsp">Register Complaint</a>
                <a href="view-complaints">View Complaints</a>
            </div>
        </div>
    </div>
    <div class="nav-right">
        <span>
            <%
                String username = (String) session.getAttribute("username");
                out.print(username != null ? username : "Guest");
            %>
        </span>
        <form method="post" action="login.jsp" style="margin: 0;">
            <button class="logout-btn" type="submit">Logout</button>
        </form>
    </div>
</div>

</body>
</html>