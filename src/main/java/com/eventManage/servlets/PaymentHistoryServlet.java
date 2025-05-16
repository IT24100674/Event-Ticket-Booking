package com.eventManage.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/paymentHistory")
public class PaymentHistoryServlet extends HttpServlet {
    private PaymentManager paymentManager;

    @Override
    public void init() throws ServletException {
        paymentManager = new PaymentManager(getServletContext());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        if (userId != null) {
            try {
                List<Payment> payments = paymentManager.getPaymentsByUser(userId);
                request.setAttribute("payments", payments);
                request.setAttribute("userId", userId);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("/paymentHistory.jsp").forward(request, response);
    }
}