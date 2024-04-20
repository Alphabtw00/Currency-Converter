package com.example.currencyconverter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/CurrencyConverter")
public class CurrencyConverterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final Map<String, Double> EXCHANGE_RATES = new HashMap<>();

    @Override
    public void init() throws ServletException { //read exchange rates from file at start up

        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream("exchange_rates.txt");
             BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 2) {
                    String currency = parts[0];
                    double rate = Double.parseDouble(parts[1]);
                    EXCHANGE_RATES.put(currency, rate);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sourceCurrency = request.getParameter("sourceCurrency");
        String targetCurrency = request.getParameter("targetCurrency");
        String amountStr = request.getParameter("amount");

        // Server-side validation
        if (sourceCurrency == null || targetCurrency == null || amountStr == null) {
            response.sendRedirect("index.jsp"); // Redirect to input page if parameters are missing
            return;
        }

        double amount;
        try {
            amount = Double.parseDouble(amountStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid amount entered.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (!EXCHANGE_RATES.containsKey(sourceCurrency) || !EXCHANGE_RATES.containsKey(targetCurrency)) {
            request.setAttribute("errorMessage", "Invalid currencies selected.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        double sourceRate = EXCHANGE_RATES.get(sourceCurrency);
        double targetRate = EXCHANGE_RATES.get(targetCurrency);

        double convertedAmount = (amount / sourceRate) * targetRate;

        request.setAttribute("convertedAmount", convertedAmount);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
