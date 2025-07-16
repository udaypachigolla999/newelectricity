<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Customer Registration - EMS</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <style>
    *, *::before, *::after {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #0047ab, #00b4db);
      color: #0d1a26;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      width: 900px;
      max-width: 95vw;
      background: #ffffffdd;
      border-radius: 16px;
      box-shadow: 0 20px 25px rgba(0,0,0,0.12), 0 10px 10px rgba(0,0,0,0.07);
      overflow: hidden;
    }

    .content {
      padding: 60px 50px;
      background: #0275d8;
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
      gap: 25px;
    }

    .content h1 {
      font-weight: 900;
      font-size: 3rem;
      margin: 0;
      line-height: 1.1;
      letter-spacing: 1px;
    }

    .content p {
      line-height: 1.5;
      font-size: 1.15rem;
      max-width: 430px;
      opacity: 0.9;
    }

    .form-section {
      padding: 60px 50px;
      background: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .form-section h2 {
      margin: 0 0 25px 0;
      font-size: 1.8rem;
      color: #0275d8;
      font-weight: 700;
      text-align: center;
    }

    label {
      margin-top: 10px;
      color: #333;
      font-weight: 600;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 12px 14px;
      margin-top: 5px;
      border: 2px solid #ddd;
      border-radius: 8px;
      font-size: 1rem;
      box-sizing: border-box;
    }

    input:focus {
      outline: none;
      border-color: #0275d8;
      box-shadow: 0 0 6px #4da6ff88;
    }

    button {
  width: 60%; /* Wider than auto, but not full width */
  max-width: 250px;
  padding: 12px 20px;
  margin: 20px auto 0 auto;
  background-color: #0275d8;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  display: block;
  font-weight: bold;
  font-size: 16px;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #025bb5;
}


.form-container form {
  display: flex;
  flex-direction: column;
  align-items: center;
}


    .msg-error, .msg-info {
      color: #c0392b;
      font-weight: 600;
      margin: 10px 0;
      font-size: 0.95rem;
      text-align: center;
    }

    .policy-link {
  display: block;        
  font-size: 12px;
  color: #0275d8;
  text-decoration: underline;
  margin-top: 10px;
  margin-bottom: 10px;
}


    .policy-box {
      display: none;
      background-color: #f0f8ff;
      padding: 10px;
      border: 1px solid #0275d8;
      border-radius: 5px;
      font-size: 13px;
      margin-top: 8px;
    }

    .error-text {
      color: red;
      font-size: 13px;
      display: none;
      margin-top: 5px;
    }

    .links {
      margin-top: 18px;
      text-align: center;
      font-size: 14px;
    }

    .links a {
      color: #0275d8;
      text-decoration: none;
      font-weight: 600;
    }

    .links a:hover {
      text-decoration: underline;
    }
    
    .error-text {
  color: #c0392b;
  font-weight: 600;
  margin-top: 8px;
  font-size: 0.95rem;
  text-align: left;
  display: none; /* will be shown via JS */
}
.logo-container {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 16px; 
}

.logo {
  font-size: 60px;
  color: white;
  /* Removed background and decoration */
  background: none;
  border-radius: 0;
  box-shadow: none;
  padding: 0;
}

.logo-heading {
  color: #fff;
  font-weight: 700;
  font-size: 1.75rem;
  margin: 0;
}
    .required-asterisk {
  color: red;
  margin-left: 3px;
}
    

    @media (max-width: 860px) {
      .container {
        grid-template-columns: 1fr;
        width: 90vw;
        border-radius: 12px;
      }

      .content {
        padding: 40px 30px;
        text-align: center;
      }

      .form-section {
        padding: 40px 30px;
      }
    }
  </style>
</head>
<body>
<div class="container" role="main" aria-label="Registration page for Electricity Bill Management system">

  <section class="content" aria-label="Introduction and features">
  <div class="logo-container">
    <span class="material-icons logo" aria-label="bolt icon">bolt</span>
    <h3 class="logo-heading">Electricity Bill Management</h3>
  </div>
  <p>Join now to manage bills, view usage, and track service history. Stay connected, stay in control.</p>
  
  <ul style="list-style: none; padding: 0; margin: 0;">
    <li><span class="material-icons" style="vertical-align: middle; margin-right: 8px; color: #fff;">bolt</span>Instant bill payments</li>
    <li><span class="material-icons" style="vertical-align: middle; margin-right: 8px; color: #fff;">credit_card</span>Secure and fast payments</li>
    <li><span class="material-icons" style="vertical-align: middle; margin-right: 8px; color: #fff;">support_agent</span>Easy complaint registration</li>
    <li><span class="material-icons" style="vertical-align: middle; margin-right: 8px; color: #fff;">restore</span>Restore account anytime</li>
  </ul>
</section>


  <section class="form-section" aria-label="Customer registration form">
    <%
      String msg2 = (String) session.getAttribute("msg2");
      if (msg2 != null) {
    %>
      <div class="msg-error" role="alert"><%= msg2 %></div>
    <%
        session.removeAttribute("msg2");
      }
    %>
    <h2>Customer Registration</h2>
    <form action="register" method="post" onsubmit="return validateForm()">
      <label for="consumerId">Consumer Number<span class="required-asterisk">*</span></label>
      <input type="text" id="consumerId" name="custid"  placeholder="Enter your Consumer Number" required>
      <div id="consumerIdError" class="error-text">
  <span class="material-icons" style="font-size: 18px; vertical-align: middle; color: #c0392b;">info</span>
  Consumer Number must be exactly 5 digits and cannot be negative.
</div>

      <label for="customerName">Customer Name<span class="required-asterisk">*</span></label>
      <input type="text" id="customerName" name="name" placeholder="Enter your Name" required>
      <div id="customerNameError" class="error-text">
  <span class="material-icons" style="font-size: 18px; vertical-align: middle; color: #c0392b;">info</span>
  Name should contain only alphabets.
</div>

      <label for="email">Email<span class="required-asterisk">*</span></label>
      <input type="email" id="email" name="email" placeholder="Enter your Email" required>

      <label for="mobile">Mobile Number<span class="required-asterisk">*</span></label>
      <input type="text" id="mobile" name="mobile" maxlength="10" pattern="\d{10}" placeholder="Enter your Mobile Number" required>

      <label for="address">Address<span class="required-asterisk">*</span></label>
      <input type="text" id="address" name="address" placeholder="Enter your Address" required>

      <label for="password">Password<span class="required-asterisk">*</span></label>
      <input type="password" id="password" name="password" placeholder="Enter your Password" required>

      <label for="confirmPassword">Confirm Password<span class="required-asterisk">*</span></label>
      <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter your Password" required>

      <div id="passwordError" class="error-text">
  <span class="material-icons" style="font-size: 18px; vertical-align: middle; color: #c0392b;">info</span>
  Password doesn't meet the required criteria.
</div>

<div id="confirmPasswordError" class="error-text">
  <span class="material-icons" style="font-size: 18px; vertical-align: middle; color: #c0392b;">info</span>
  Passwords do not match.
</div>

      <div style="margin-top: 12px; margin-bottom: 10px;">
  <a href="#" class="policy-link" onclick="togglePolicy(event)">View password policy</a>
</div>

      <div id="policyPopup" class="policy-box">
        <strong>Password must:</strong>
        <ul>
          <li>Be 8-20 characters long</li>
          <li>Contain at least 1 uppercase letter</li>
          <li>Contain at least 1 lowercase letter</li>
          <li>Contain at least 1 digit</li>
          <li>Contain at least 1 special character (@, #, $, etc.)</li>
        </ul>
      </div>

      <button type="submit">Register</button>

      <div class="links">
      <!--   <a href="login.jsp">Account already exists? Go to Login</a> -->
        <div>Account already exists? <a href="login.jsp">Go to Login</a></div>
      </div>
    </form>
  </section>
</div>
</body>
</html>

<script>
  function togglePolicy(event) {
    event.preventDefault();
    const popup = document.getElementById("policyPopup");
    popup.style.display = popup.style.display === "none" ? "block" : "none";
  }

  function validateForm() {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const passwordError = document.getElementById("passwordError");
    const confirmPasswordError = document.getElementById("confirmPasswordError");
    const consumerId = document.getElementById("consumerId").value.trim();
    const consumerIdError = document.getElementById("consumerIdError");
    const customerName = document.getElementById("customerName").value.trim();
    const customerNameError = document.getElementById("customerNameError");

    const regex = /^(?=(?:.*[A-Z]){1,})(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!_\-]).{8,20}$/;
    
    let isValid = true;
    
 // Check if it's exactly 5 digits, all numbers, and non-negative
    if (!/^\d{5}$/.test(consumerId)) {
      consumerIdError.style.display = "block";
      isValid = false;
    } else {
      consumerIdError.style.display = "none";
    }
    
    if (!/^[A-Za-z\s]+$/.test(customerName)) {
    	  customerNameError.style.display = "block";
    	  isValid = false;
    	} else {
    	  customerNameError.style.display = "none";
    	}

    if (!regex.test(password)) {
      passwordError.style.display = "block";
      confirmPasswordError.style.display = "none";
      isValid = false;
    } else {
      passwordError.style.display = "none";
      if (password !== confirmPassword) {
        confirmPasswordError.style.display = "block";
        isValid = false;
      } else {
        confirmPasswordError.style.display = "none";
      }
    }

    return isValid;
  }

  document.getElementById("password").addEventListener("focus", function () {
    document.getElementById("passwordError").style.display = "none";
  });

  document.getElementById("confirmPassword").addEventListener("focus", function () {
    document.getElementById("confirmPasswordError").style.display = "none";
  });
  
  document.getElementById("consumerId").addEventListener("focus", function () {
	  document.getElementById("consumerIdError").style.display = "none";
	});
  document.getElementById("customerName").addEventListener("focus", function () {
	  document.getElementById("customerNameError").style.display = "none";
	});

</script>