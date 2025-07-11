<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        
    </style>
</head>
<body>
  <div class="form-container">
    <h2>Customer Registration</h2>
    <form action="register" method="post">
      <label for="consumerId">Consumer ID</label>
      <input type="text" id="consumerId" name="custid" required>

      <label for="customerName">Customer Name</label>
      <input type="text" id="customerName" name="name" required>

      <label for="email">Email</label>
      <input type="email" id="email" name="email" required>

      <label for="mobile">Mobile Number</label>
      <input type="text" id="mobile" name="mobile" maxlength="10" pattern="\d{10}" required>
      
      <label for="address">Address</label>
      <input type="text" id="address" name="address" required>

     <!--<label for="userId">User ID</label>
      <input type="text" id="userId" name="userId" required>  --> 

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>

   
      <button type="submit">Register</button>
    </form>
  </div>
</body>
</html>