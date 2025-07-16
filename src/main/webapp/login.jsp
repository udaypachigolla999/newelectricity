<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Electricity Bill Management - Login</title>
<style>
  /* Reset and base */
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

  /* Container */
  .container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    width: 900px;
    max-width: 95vw;
    background: #ffffffdd;
    border-radius: 16px;
    box-shadow:
      0 20px 25px rgba(0,0,0,0.12),
      0 10px 10px rgba(0,0,0,0.07);
    overflow: hidden;
  }

  /* Left side content */
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

  .features {
    margin-top: 15px;
    list-style: none;
    padding: 0;
  }

  .features li {
    margin-bottom: 14px;
    font-weight: 600;
    font-size: 1.1rem;
    position: relative;
    padding-left: 30px;
  }


  /* Right side login form */
  .login {
    padding: 60px 50px;
    background: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .login h2 {
    margin: 0 0 25px 0;
    font-size: 1.8rem;
    color: #0275d8;
    font-weight: 700;
  }

  form {
    display: flex;
    flex-direction: column;
  }

  input[type="email"],
  input[type="password"] {
    padding: 14px 15px;
    font-size: 1rem;
    border: 2px solid #ddd;
    border-radius: 8px;
    margin-bottom: 20px;
    transition: border-color 0.25s ease;
  }

  input[type="email"]:focus,
  input[type="password"]:focus {
    outline: none;
    border-color: #0275d8;
    box-shadow: 0 0 6px #4da6ff88;
  }

  button {
    background: linear-gradient(45deg, #0275d8 0%, #00b4db 100%);
    border: none;
    padding: 15px;
    font-size: 1.1rem;
    font-weight: 700;
    color: white;
    border-radius: 10px;
    cursor: pointer;
    transition: background 0.3s ease;
    box-shadow: 0 6px 12px rgba(2, 117, 216, 0.48);
  }
  button:hover {
    background: linear-gradient(45deg, #004a99 0%, #009ecb 100%);
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
    margin: 0 8px;
  }

  .links a:hover {
    text-decoration: underline;
  }

  /* Message error style */
  .msg-error {
    color: #c0392b;
    font-weight: 600;
    margin-bottom: 12px;
    font-size: 0.95rem;
    text-align: center;
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
.required {
  color: red;
  font-weight: bold;
  margin-left: 2px;
}


  /* Responsive */
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
    .features {
      padding-inline-start: 0;
    }
    .features li {
      display: inline-block;
      margin: 0 12px 16px 12px;
      font-size: 1rem;
      padding-left: 0;
      position: static;
    }
    .features li::before {
      content: none;
    }
    .login {
      padding: 40px 30px 50px 30px;
    }
   }
</style>
</head>
<body>
<div class="container" role="main" aria-label="Login page for Electricity Bill Management system">
  <section class="content" aria-label="Introduction and features">
    <div class="logo-container">
	  <span class="material-icons logo" aria-label="bolt icon">bolt</span>
	  <h3 class="logo-heading">Electricity Bill Management</h3>
	</div>

    <p>Manage your electricity bills seamlessly with instant access to billing details, payment history, and complaint management.</p>
    <ul class="features" aria-label="Key features list">
  <li><span class="material-icons" style="vertical-align: middle; margin-right: 8px; color: #fff;">bolt</span>Instant bill payments</li>
  <li><span class="material-icons" style="vertical-align: middle; margin-right: 8px; color: #fff;">credit_card</span>Secure and fast payments</li>
  <li><span class="material-icons" style="vertical-align: middle; margin-right: 8px; color: #fff;">support_agent</span>Easy complaint registration</li>
  <li><span class="material-icons" style="vertical-align: middle; margin-right: 8px; color: #fff;">restore</span>Restore account anytime</li>
</ul>
  </section>

  <section class="login" aria-label="User login form">
    <h2>Login to Your Account</h2>

    <%
      String msg2 = (String) session.getAttribute("msg2");
      if (msg2 != null) {
    %>
      <div class="msg-error" role="alert"><%= msg2 %></div>
    <%
        session.removeAttribute("msg2"); 
      }
    %>

    <form method="post" action="login" novalidate>
  <label for="email">Email Address <span class="required" aria-hidden="true">*</span></label>
  <input type="email" id="email" name="email" placeholder="Enter your email" required aria-required="true" aria-label="Email address" />

  <label for="password">Password <span class="required" aria-hidden="true">*</span></label>
  <input type="password" id="password" name="password" placeholder="Enter your password" required aria-required="true" aria-label="Password" />

  <button type="submit" aria-label="Submit login form">Login</button>
</form>


    <div class="links">
      <div>Not registered? <a href="register.jsp">Register</a></div>
      <div>Deactivated your account? <a href="restoreAccount.jsp">Restore Account</a></div>
    </div>
  </section>
</div>
</body>
</html>