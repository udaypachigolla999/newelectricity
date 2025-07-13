<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Home - EMS</title>
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
      margin: 0 auto;
    }

    .features {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      padding: 20px 20px 40px;
      background-color: #ffffff;
    }

    .features h2.section-heading {
      position: relative;
      width: 100%;
      text-align: center;
      font-size: 28px;
      color: #1f3a93;
      margin-bottom: 40px;
      z-index: 1;
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
    }
  </style>
</head>
<body>

<jsp:include page="adminMenu.jsp" />

<div class="hero-section">
  <h1>Welcome, Admin</h1>
  <p>Manage users, bills, and complaints efficiently through your EMS admin dashboard.</p>
</div>

<div class="features">
  <h2 class="section-heading">Dashboard Overview</h2>

  <div class="feature">
    <span class="material-icons">receipt</span>
    <h3>Manage Bills</h3>
    <p>View billing history, generate and add new bills for registered customers.</p>
  </div>

  <div class="feature">
    <span class="material-icons">people</span>
    <h3>Customer Accounts</h3>
    <p>Access customer details and monitor user activity across the system.</p>
  </div>

  <div class="feature">
    <span class="material-icons">report</span>
    <h3>Complaint Handling</h3>
    <p>Review and resolve user complaints to ensure smooth service delivery.</p>
  </div>

</div>

<div class="footer">
  &copy; 2025 Electricity Management System — Admin Panel
</div>

</body>
</html>