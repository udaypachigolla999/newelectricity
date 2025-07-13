<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Menu</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <style>
    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
    }

    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #1f3a93;
      padding: 10px 30px;
      color: white;
      position: relative;
    }

    .nav-brand {
      font-size: 20px;
      font-weight: bold;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .nav-brand .material-icons {
      font-size: 24px;
      color: #ffcc00;
    }

    .nav-center {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      display: flex;
      gap: 30px;
    }

    .dropdown {
      position: relative;
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

    .dropdown-content {
      display: none;
      position: absolute;
      top: 40px;
      background-color: white;
      color: black;
      min-width: 180px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      z-index: 1000;
      border-radius: 4px;
    }

    .dropdown-content a {
      padding: 12px 18px;
      display: block;
      font-size: 15px;
      color: #333;
      text-decoration: none;
      border-radius: 4px;
      background: white;
      transition: background-color 0.3s, color 0.3s;
    }

    .dropdown-content a:hover {
      background-color: #e6f0ff;
      color: #1f3a93;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }

    .profile-dropdown {
      position: relative;
    }

    .profile-button {
      background-color: transparent;
      color: white;
      border: none;
      padding: 10px;
      font-size: 16px;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .profile-content {
      display: none;
      position: absolute;
      top: 40px;
      right: 0;
      background-color: white;
      color: black;
      min-width: 180px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      z-index: 1000;
      border-radius: 4px;
    }

    .profile-content form,
    .profile-content button {
      padding: 12px 18px;
      font-size: 15px;
      color: #333;
      background: white;
      border: none;
      width: 100%;
      text-align: left;
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
    }

    .profile-content button:hover {
      background-color: #e6f0ff;
      color: #1f3a93;
    }

    .profile-dropdown:hover .profile-content {
      display: block;
    }

    .nav-right {
      display: flex;
      align-items: center;
      gap: 10px;
    }
  </style>
</head>
<body>
  <div class="navbar">
    <!-- Brand -->
   

	<div class="nav-brand">
	  <a href="home.jsp" style="display: flex; align-items: center; gap: 8px; color: white; text-decoration: none;">
	    <span class="material-icons" style="font-size: 24px; color: #ffcc00;">bolt</span>
	    <span style="font-size: 20px; font-weight: bold;">Electricity Management System</span>
	  </a>
	</div>

    <!-- Center Navigation -->
    <div class="nav-center">
    	<a href="home.jsp" style="color: white; font-size: 16px; text-decoration: none; padding: 10px;">Home</a>
    
    
      <div class="dropdown">
        <button>Bills <span class="material-icons" style="font-size: 16px;">expand_more</span></button>
        <div class="dropdown-content">
          <a href="view-bills">Pay Bills</a>
          <a href="view-billsHistory">View Bill History</a>
        </div>
      </div>
      <div class="dropdown">
        <button>Complaints <span class="material-icons" style="font-size: 16px;">expand_more</span></button>
        <div class="dropdown-content">
          <a href="registerComplaint.jsp">Register Complaint</a>
          <a href="view-complaints">View Complaints</a>
        </div>
      </div>
    </div>

    <!-- Right -->
    <div class="nav-right">
      <div class="profile-dropdown">
        <button class="profile-button">
          Welcome,
          <%
            String username = (String) session.getAttribute("username");
            out.print(username != null ? username : "Guest");
          %>
          <span class="material-icons">account_circle</span>
        </button>
        <div class="profile-content">
          <form method="get" action="profile">
            <button type="submit">View & Edit Profile</button>
          </form>
          <form method="post" action="DeactivateAccountServlet" onsubmit="return confirm('Are you sure you want to deactivate your account?')">
			  <button type="submit">Deactivate Account</button>
		  </form>
          
          <form method="post" action="LogoutServlet">
            <button type="submit">Logout</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>