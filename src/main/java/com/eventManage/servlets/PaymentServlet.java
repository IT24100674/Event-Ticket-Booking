package com.eventManage.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/makePayment")
public class PaymentServlet extends HttpServlet {
    private PaymentManager paymentManager;

    @Override
    public void init() throws ServletException {
        paymentManager = new PaymentManager(getServletContext());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");

        String paymentId;
        if (paymentMethod.equals("card")) {
            paymentId = "CARD" + System.currentTimeMillis();
        } else {
            paymentId = "BANK" + System.currentTimeMillis();
        }
        String date = LocalDate.now().toString();
        Payment payment;
        if (paymentMethod.equals("card")) {
            payment = new CardPayment(paymentId, userId, amount, "Pending", date, "1234567890123456", "User");
        } else {
            payment = new BankTransfer(paymentId, userId, amount, "Pending", date, "9876543210", "Bank");
        }

        paymentManager.addPayment(payment);
        response.sendRedirect("paymentHistory?userId=" + userId);
    }
}