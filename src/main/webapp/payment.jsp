<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Quick EBill - Payment method</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <style>
    * { box-sizing: border-box; }

    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #e0f2f1;
    }

    .top-title {
      color: red;
      padding: 10px 20px;
      font-size: 24px;
      font-weight: bold;
    }

    .top-bar {
      background-color: #666;
      color: white;
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
    }

    .left-section {
      display: flex;
      align-items: center;
      gap: 20px;
      flex-wrap: wrap;
    }

    .menu {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }

    .menu a {
      color: white;
      text-decoration: none;
      font-weight: bold;
    }

    .menu-toggle {
      display: none;
      font-size: 24px;
      cursor: pointer;
    }

    .right-section {
      display: flex;
      align-items: center;
      gap: 15px;
      flex-wrap: wrap;
    }

    .logout-btn {
      background-color: red;
      color: white;
      padding: 6px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
    }

    .section-title {
      background-color: #0277bd;
      color: white;
      padding: 10px;
      font-size: 18px;
      border-radius: 5px;
      margin-bottom: 10px;
    }

    @media (max-width: 768px) {
      .top-bar {
        flex-direction: column;
        align-items: flex-start;
      }

      .menu-toggle {
        display: block;
      }

      .menu {
        display: none;
        flex-direction: column;
        width: 100%;
        margin-top: 10px;
      }

      .menu.active {
        display: flex;
      }

      .right-section {
        width: 100%;
        justify-content: space-between;
        margin-top: 10px;
      }
    }

    /* Payment form styling */
    .container {
      max-width: 600px;
      margin: 30px auto;
      background-color: white;
      padding: 25px;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h2 {
      color: #007B8A;
      margin-bottom: 20px;
      text-align: center;
    }

    form label {
      display: block;
      margin-top: 15px;
      font-weight: bold;
    }

    input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border-radius: 4px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border-radius: 4px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    .form-row {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
    }

    .form-row input {
      flex: 1 1 100%;
    }

    .payment-amount {
      margin-top: 20px;
      font-size: 18px;
      text-align: right;
      font-weight: bold;
      color: #007B8A;
    }

    .buttons {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      justify-content: space-between;
      margin-top: 25px;
    }

    .btn {
      padding: 10px 20px;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
    }

    .btn-pay {
      background-color: gold;
      color: black;
    }

    .btn-cancel {
      background-color: #ccc;
      color: black;
    }

    @media (max-width: 600px) {
      .form-row input {
        flex: 1 1 100%;
      }

      .buttons {
        flex-direction: column;
        align-items: stretch;
      }
    }
  </style>
</head>
<body>

<div class="top-title">Electricity Management</div>

<div class="top-bar">
  <div class="left-section">
    <div class="menu-toggle" onclick="toggleMenu()">â°</div>
    <div class="menu" id="navMenu">
      <a href="#">Home</a>
      <a href="#">Pay Bill</a>
      <a href="#">Register Complaint</a>
      <a href="#">Complaint Status</a>
    </div>
  </div>
  <div class="right-section">
    <div>Welcome: <strong>CustName</strong></div>
    <button class="logout-btn" onclick="logout()">Logout</button>
  </div>
</div>

<div class="container">
  <div class="section-title">Payment Screen</div>

  <p style="color: #007B8A; font-weight: bold; text-decoration: underline; text-decoration-color: red; cursor: pointer;">Pay by Credit Card</p>
  <div style="margin-bottom: 15px;">
    <img src="https://img.icons8.com/color/48/000000/visa.png" height="24"/>
    <img src="https://img.icons8.com/color/48/000000/mastercard-logo.png" height="24"/>
  </div>

  <form onsubmit="handlePayment(event)">
    <label for="card-number">Card Number</label>
    <input type="text" id="card-number" placeholder="Enter card number" required maxlength="19" />

    <div class="form-row">
      <div>
        <label for="expiry">Expiration Date</label>
        <input type="text" id="expiry" placeholder="MM/YY" required />
      </div>
      <div>
        <label for="cvv">CVV</label>
        <input type="password" id="cvv" placeholder="CVC" required maxlength="3" />
      </div>
    </div>

    <label for="cardholder">Card Holder Name</label>
    <input type="text" id="cardholder" placeholder="Enter card holder name" required />

    <div class="payment-amount">
      Payment Amount:<span id="amount">2,028.00</span>
    </div>

    <div class="buttons">
      <button type="submit" class="btn btn-pay">Make Payment</button>
      <button type="button" class="btn btn-cancel" onclick="cancelPayment()">Cancel</button>
    </div>
  </form>
</div>

<script>
  function toggleMenu() {
    document.getElementById('navMenu').classList.toggle('active');
  }

  function logout() {
    alert("Logging out...");
    window.location.href = "login.jsp";
  }

  function cancelPayment() {
    if (confirm("Cancel payment and return to Home?")) {
      window.location.href = "home.html";
    }
  }

  function handlePayment(event) {
    event.preventDefault();

    const cardNum = document.getElementById('card-number').value.replace(/\s/g, '');
    const expiry = document.getElementById('expiry').value;
    const cvv = document.getElementById('cvv').value;
    const holder = document.getElementById('cardholder').value.trim();

    const expiryPattern = /^(0[1-9]|1[0-2])\/\d{2}$/;

    if (cardNum.length !== 16 || !/^\d+$/.test(cardNum)) {
      alert("Please enter a valid 16-digit card number.");
      return;
    }

    if (!expiryPattern.test(expiry)) {
      alert("Please enter a valid expiry date in MM/YY format.");
      return;
    }

    if (!/^\d{3,4}$/.test(cvv)) {
      alert("Please enter a valid 3 or 4 digit CVV.");
      return;
    }

    if (holder.length < 2) {
      alert("Please enter a valid cardholder name.");
      return;
    }

    alert("Payment Successful! Thank you.");
    window.location.href = "home.html";
  }

  document.getElementById('card-number').addEventListener('input', function (e) {
    let value = e.target.value.replace(/\D/g, '');
    value = value.substring(0, 16); 
    e.target.value = value.replace(/(.{4})/g, '$1 ').trim();
  });

  document.getElementById('expiry').addEventListener('input', function (e) {
    let value = e.target.value.replace(/\D/g, '').substring(0, 4);
    if (value.length >= 3) {
      e.target.value = value.substring(0, 2) + '/' + value.substring(2);
    } else {
      e.target.value = value;
    }
  });

  document.getElementById('cvv').addEventListener('input', function (e) {
    e.target.value = e.target.value.replace(/\D/g, '').substring(0, 3);
  });
</script>


</body>
</html>