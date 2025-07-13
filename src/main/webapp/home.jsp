<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home - EMS</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Roboto', sans-serif;
      background: #f0f4f8;
    }

    .hero-section {
      background: linear-gradient(to right, #1f3a93, #007bff);
      color: white;
      padding: 60px 20px;
      text-align: center;
    }

    .hero-section h1 {
      font-size: 42px;
      margin-bottom: 20px;
    }

    .hero-section p {
      font-size: 18px;
      max-width: 700px;
      margin: 0 auto 30px;
    }

    .hero-buttons {
      margin-top: 30px;
    }

    .hero-buttons a {
      text-decoration: none;
      background: white;
      color: #1f3a93;
      padding: 12px 24px;
      border-radius: 6px;
      font-size: 16px;
      font-weight: bold;
      margin: 0 10px;
      transition: background 0.3s, color 0.3s;
    }

    .hero-buttons a:hover {
      background: #e6f0ff;
      color: #0056b3;
    }

    .features {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      padding: 10px 20px 40px;
      background-color: #ffffff;
    }

    .features h2 {
      width: 100%;
      text-align: center;
      font-size: 28px;
      color: #1f3a93;
      margin-bottom: 40px;
    }

    .feature {
      background: #f9fbff;
      border: 1px solid #dde6f2;
      border-radius: 10px;
      width: 280px;
      margin: 15px;
      padding: 25px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      text-align: center;
      transition: transform 0.3s;
    }

    .feature:hover {
      transform: translateY(-5px);
    }

    .feature .material-icons {
      font-size: 48px;
      color: #1f3a93;
      margin-bottom: 10px;
    }

    .feature h3 {
      margin: 10px 0;
      color: #1f3a93;
    }

    .feature p {
      font-size: 14px;
      color: #444;
    }

    .footer {
      background: #1f3a93;
      color: white;
      padding: 20px;
      text-align: center;
      font-size: 14px;
    }

    @media (max-width: 768px) {
      .hero-section h1 {
        font-size: 32px;
      }

      .hero-buttons a {
        display: block;
        margin: 10px auto;
      }
    }
  </style>
</head>
<body>




<jsp:include page="menu.jsp" />

<div class="hero-section">
  <h1>Welcome to Electricity Management System</h1>
  <p>Manage your electricity bills, track your consumption, register complaints and stay updated with ease — all in one place.</p>
  <div class="hero-buttons">
    <a href="view-bills">Pay Bills</a>
    <a href="registerComplaint.jsp">Register Complaint</a>
    <a href="profile">My Profile</a>
  </div>
</div>

<!-- Features Section with heading inside -->
<div class="features">
  <h2><span class="material-icons" style="vertical-align: middle; font-size: 30px; color:  orange;">flash_on</span> What We Offer</h2>


  <div class="feature">
    <span class="material-icons">receipt_long</span>
    <h3>Bill Management</h3>
    <p>View current bills, pay instantly, and access billing history at your convenience.</p>
  </div>

  <div class="feature">
    <span class="material-icons">report_problem</span>
    <h3>Complaint Services</h3>
    <p>Quickly register and track the status of your service-related issues and complaints.</p>
  </div>

  <div class="feature">
    <span class="material-icons">account_circle</span>
    <h3>Profile Management</h3>
    <p>Update your contact details, preferences, and view your login activity.</p>
  </div>
</div>

<div class="footer">
  &copy; 2025 Electricity Management System. All rights reserved.
</div>

</body>
</html>