<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Complaint</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color:  #e8f0fe; /* Light blue background similar to customer registration */
        }
        .container {
            margin-top: 50px;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #007bff; /* Blue color for the heading */
        }
    </style>
</head>
<body>
 <jsp:include page="menu.jsp" />
<div class="container">
    <div class="form-container">
        <h2 class="text-center">Register Complaint</h2>
        <form action="registerComplaint" method="post">
            
            <div class="form-group">
                <label for="status">Complaint Type</label>
                <select class="form-control" id="status" name="complaint-type" required>
                    <option value="Power supply">Power Supply</option>
                    <option value="Billing">Billing Issues</option>
                    <option value="Meter">Meter Issues</option>
                    <option value="Others">Others</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
            </div>
            
            <button type="submit" class="btn btn-primary btn-block">Register Complaint</button>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>