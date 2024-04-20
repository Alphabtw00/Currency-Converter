<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Conversion Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        .result {
            text-align: center;
            font-size: 24px;
            margin-top: 20px;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Conversion Result</h1>
    <%
        double convertedAmount = (double) request.getAttribute("convertedAmount");
        String targetCurrency = request.getParameter("targetCurrency");
    %>
    <p class="result">The converted amount is: <%= String.format("%.2f", convertedAmount) %> <%= targetCurrency %></p>
    <a href="index.jsp">Convert Another Amount</a>
</div>
</body>
</html>
