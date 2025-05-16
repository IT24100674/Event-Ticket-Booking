package com.eventManage.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/refundPayment")
public class RefundServlet extends HttpServlet {
    private PaymentManager paymentManager;

    @Override
    public void init() throws ServletException {
        paymentManager = new PaymentManager(getServletContext());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String userId = request.getParameter("userId");
        paymentManager.deletePayment(paymentId);
        response.sendRedirect("paymentHistory?userId=" + userId);
    }
}