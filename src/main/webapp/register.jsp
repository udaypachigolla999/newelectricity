<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Registration - EMS</title>
  <style>
    html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #e8f0fe;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #e8f0fe;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            width: 400px;
            background-color: #fff;
            padding: 25px 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color:  #0275d8;
        }

        label {
            display: block;
            margin-top: 10px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color:  #0275d8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color:  #0275d8;
        }
        .container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.header h1 {
    color: #0275d8;
    margin-bottom: 5px;
}

.header p {
    margin-top: 0;
    color: #555;
}
        
    </style>
</head>
<body>
<div class="container">
    <!--  Header Section (copied from login page) -->
   <div class="header">
            <h1>Electricity Bill Management</h1>
            <p>Manage your bills, payments and complaints efficiently</p>
        </div>
  <div class="form-container">
  <%
		    String msg2 = (String) session.getAttribute("msg2");
		    if (msg2 != null) {
		%>
		    <p style="color: red; text-align: center;"><%= msg2 %></p>
		<%
		        session.removeAttribute("msg2"); 
		    }
		%>
    <h2>Customer Registration</h2>
    <form action="register" method="post" onsubmit="return validateForm()">
      <label for="consumerId">Consumer Number</label>
      <input type="text" id="consumerId" name="custid" placeholder="Enter your Consumer Number" required>

      <label for="customerName">Customer Name</label>
      <input type="text" id="customerName" name="name" placeholder="Enter your Name" required>

      <label for="email">Email</label>
      <input type="email" id="email" name="email" placeholder="Enter your Email" required>

      <label for="mobile">Mobile Number</label>
      <input type="text" id="mobile" name="mobile" maxlength="10" pattern="\d{10}" placeholder="Enter your Mobile Number" required>
      
      <label for="address">Address</label>
      <input type="text" id="address" name="address" placeholder="Enter your Address" required>


		<label for="password">Password</label>
		<input type="password" id="password" name="password" placeholder="Enter your Password" required>
		
		
		<label for="confirmPassword">Confirm Password</label>
		<input type="password" id="confirmPassword" name="confirmPassword" required>
		
		<small id="confirmPasswordError" style="color: red; display: none;">
	 <span style="font-weight: bold; font-size: 16px; vertical-align: middle;">&#9432;</span>
		 Passwords do not match.
		</small>
		
		<!--  Trigger for the popup -->
		<p style="margin: 5px 0;">
		  <a href="#" onclick="togglePolicy(event)" style="font-size: 12px; color: #0275d8; text-decoration: underline;">View password policy</a>
		</p>
		
		<!-- ðŸ”¹ Password policy popup box -->
		<div id="policyPopup" style="display: none; background-color: #f0f8ff; padding: 10px; border: 1px solid #0275d8; border-radius: 5px; font-size: 13px; color: #333;">
		  <strong>Password must:</strong>
		  <ul style="padding-left: 18px; margin: 5px 0;">
		    <li>Be 8-20 characters long</li>
		    <li>Contain at least 1 uppercase letter</li>
		    <li>Contain at least 1 lowercase letter</li>
		    <li>Contain at least 1 digit</li>
		    <li>Contain at least 1 special character (@, #, $, etc.)</li>
		  </ul>
		</div>

<!-- ðŸ”´ Error message -->
<small id="passwordError" style="color: red; display: none;">
  <span style="font-weight: bold; font-size: 16px; vertical-align: middle;">&#9432;</span>
  Password doesn't meet the required criteria.
</small>


		
   
      <button type="submit">Register</button>
      
       
      <p style="margin-top: 10px; text-align: center;">
    <a href="login.jsp" style="color: #0275d8; text-decoration: underline; font-size: 14px;">Account already exists? Go to Login</a>
</p>
    </form>
  </div>
  </div>
</body>
</html>

<script>
  function togglePolicy(event) {
    event.preventDefault(); // prevent link reload
    const popup = document.getElementById("policyPopup");
    popup.style.display = popup.style.display === "none" ? "block" : "none";
  }

  function validateForm() {
    const password = document.getElementById("password").value;
    const errorMsg = document.getElementById("passwordError");
    const confirmPassword = document.getElementById("confirmPassword").value;
    const passwordError = document.getElementById("passwordError");
    const confirmPasswordError = document.getElementById("confirmPasswordError");

    const regex = /^(?=(?:.*[A-Z]){1,})(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!_\-]).{8,20}$/;
    
    let isValid = true;

	if (!regex.test(password)) {
		passwordError.style.display = "block";
		confirmPasswordError.style.display = "none"; 
		isValid = false;
	} 
	else 
	{
		passwordError.style.display = "none";
	
		if (password !== confirmPassword) 
		{
			confirmPasswordError.style.display = "block";
			isValid = false;
		} 
		else 
		{
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
</script>
