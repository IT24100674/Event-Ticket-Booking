package com.eventManage.servlets;

public abstract class Payment {
    private String paymentId;
    private String userId;
    private double amount;
    private String status;
    private String date;

    public Payment(String paymentId, String userId, double amount, String status, String date) {
        this.paymentId = paymentId;
        this.userId = userId;
        this.amount = amount;
        this.status = status;
        this.date = date;
    }

    public String getPaymentId() { return paymentId; }
    public String getUserId() { return userId; }
    public double getAmount() { return amount; }
    public void setStatus(String status) { this.status = status; }
    public String getStatus() { return status; }
    public String getDate() { return date; }

    public abstract String processPayment();
}