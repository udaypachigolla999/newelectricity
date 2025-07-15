<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pay Bill - EMS</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #e8f0fe;
        }

        

        .container {
            max-width: 600px;
            margin: 40px auto;
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #0275d8;
            margin-bottom: 20px;
        }

        form label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .form-row {
            display: flex;
            gap: 10px;
        }

        .form-row div {
            flex: 1;
        }

        .payment-amount {
            margin-top: 20px;
            font-size: 18px;
            text-align: right;
            font-weight: bold;
            color: #0275d8;
        }

        .buttons {
            display: flex;
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
    </style>
</head>
<body>

<!-- Navbar -->
<jsp:include page="menu.jsp" />

<!-- Payment Form -->
<div class="container">
    <h2>Bill Payment</h2>

<%
    String billId = request.getParameter("billId");
    String amountStr = request.getParameter("amount");
    Double amount = amountStr != null ? Double.parseDouble(amountStr) : 0.0;
%>
    <p style="color: #0275d8; font-weight: bold; text-align: left;">Pay by Credit Card</p>
    <div style="text-align: left; margin-bottom: 15px;">
        <img src="https://img.icons8.com/color/48/000000/visa.png" height="24"/>
        <img src="https://img.icons8.com/color/48/000000/mastercard-logo.png" height="24"/>
    </div>

    
    <form action="pay-bill" method="post" onsubmit="return handlePayment(event)">
    	<input type="hidden" name="billId" value="<%= billId %>" />
        <label for="card-number">Card Number</label>
        <input type="text" id="card-number" placeholder="Enter card number" required maxlength="19" />

        <div class="form-row">
            <div>
                <label for="expiry">Expiration Date</label>
                <input type="text" id="expiry" placeholder="MM/YY" required />
            </div>
            <div>
                <label for="cvv">CVV</label>
                <input type="password" id="cvv" placeholder="CVV" required maxlength="3" />
            </div>
        </div>

        <label for="cardholder">Card Holder Name</label>
        <input type="text" id="cardholder" placeholder="Enter card holder name" required />

        <div class="payment-amount">
            Payment Amount: &#8377;<%= amount %>
        </div>

        <div class="buttons">
            <button type="submit" class="btn btn-pay">Make Payment</button>
            <button type="button" class="btn btn-cancel" onclick="cancelPayment()">Cancel</button>
        </div>
    </form>
</div>

<script>
    function cancelPayment() {
        if (confirm("Cancel payment and return to Home?")) {
            window.location.href = "view-bills.jsp";
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
            return false;
        }

        if (!expiryPattern.test(expiry)) {
            alert("Please enter a valid expiry date in MM/YY format.");
            return false;
        }

        if (!/^\d{3,4}$/.test(cvv)) {
            alert("Please enter a valid 3 or 4 digit CVV.");
            return false;
        }

        if (holder.length < 2) {
            alert("Please enter a valid cardholder name.");
            return false;
        }
        const [expMonth, expYear] = expiry.split('/');
        const inputMonth = parseInt(expMonth, 10);
        const inputYear = parseInt('20' + expYear, 10);
    
    	const today = new Date();
        const currentMonth = today.getMonth() + 1; 
        const currentYear = today.getFullYear();

        if (inputYear < currentYear || (inputYear === currentYear && inputMonth < currentMonth)) {
            alert("The card is expired. Please use a valid card.");
            return false;
        }
        alert("Payment Successful! Thank you.");
        event.target.submit(); 
        return true;
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