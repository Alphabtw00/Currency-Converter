<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Currency Converter</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        select, input[type="number"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="number"] {
            -moz-appearance: textfield;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: #ff0000;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Currency Converter</h1>
    <%-- error message if present --%>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
    <div class="error-message">
        <%= errorMessage %>
    </div>
    <%
        }
    %>
    <form action="CurrencyConverter" method="post">
        <label for="sourceCurrency">Source Currency:</label>
        <select id="sourceCurrency" name="sourceCurrency">
            <option value="RUB">Russian Ruble (RUB)</option>
            <option value="INR">Indian Rupee (INR)</option>
            <option value="EUR">Euro (EUR)</option>
            <option value="GBP">British Pound (GBP)</option>
            <option value="USD">US Dollar (USD)</option>
            <option value="JPY">Japanese Yen (JPY)</option>
            <option value="AED">United Arab Emirates Dirham (AED)</option>
        </select>
        <label for="targetCurrency">Target Currency:</label>
        <select id="targetCurrency" name="targetCurrency">
            <option value="RUB">Russian Ruble (RUB)</option>
            <option value="INR">Indian Rupee (INR)</option>
            <option value="EUR">Euro (EUR)</option>
            <option value="GBP">British Pound (GBP)</option>
            <option value="USD">US Dollar (USD)</option>
            <option value="JPY">Japanese Yen (JPY)</option>
            <option value="AED">United Arab Emirates Dirham (AED)</option>
        </select>
        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" step="0.01" required>
        <input type="submit" value="Convert">
    </form>
</div>
</body>
</html>
