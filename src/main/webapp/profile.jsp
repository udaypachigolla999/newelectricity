<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Profile - EMS</title>
  <style>
    body, html {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #e8f0fe;
    }

    .container-profile {
        max-width: 450px;
        margin: 60px auto;
        background: linear-gradient(145deg, #ffffff, #f1f5ff);
        padding: 35px 25px;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        border: 1px solid #dce3f0;
        text-align: center;
        transition: all 0.3s ease-in-out;
    }

    .container-profile:hover {
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
    }

    .heading-profile {
        color: #0275d8;
        margin-bottom: 30px;
    }

    .form-label-profile {
        display: block;
        margin-top: 18px;
        margin-bottom: 6px;
        font-weight: bold;
        font-size: 14px;
        color: #333;
        text-align: left;
    }

    .form-input-profile {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid #cfd8dc;
        font-size: 15px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
        box-sizing: border-box;
    }

    .form-input-profile:focus {
        border-color: #0275d8;
        outline: none;
        box-shadow: 0 0 5px rgba(2, 117, 216, 0.3);
    }

    .submit-btn-profile {
        background-color: #0275d8;
        color: white;
        border: none;
        border-radius: 6px;
        padding: 12px 25px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        width: 100%;
        margin-top: 30px;
    }

    .submit-btn-profile:hover {
        background-color: #025aa5;
    }
  </style>
</head>
<body>

<jsp:include page="menu.jsp" />

<div class="container-profile">
    <h2 class="heading-profile">View Profile</h2>
    <form action="profile" method="post">
        <label class="form-label-profile" for="customerName">Name</label>
        <input class="form-input-profile" type="text" id="customerName" name="name" value="${userProfile.getName()}" required>

        <label class="form-label-profile" for="email">Email</label>
        <input class="form-input-profile" type="email" id="email" name="email" value="${userProfile.getEmail()}" readonly style="cursor: not-allowed;">

        <label class="form-label-profile" for="mobile">Mobile Number</label>
        <input class="form-input-profile" type="text" id="mobile" name="mobile" maxlength="10" pattern="\d{10}" value="${userProfile.getMobile()}" required>

        <label class="form-label-profile" for="address">Address</label>
        <input class="form-input-profile" type="text" id="address" name="address" value="${userProfile.getAddress()}" required>

        <button class="submit-btn-profile" type="submit">Update Profile</button>
    </form>
</div>

</body>
</html>