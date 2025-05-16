package com.eventManage.servlets;

public class CardPayment extends Payment {
    private String cardNumber;
    private String cardHolderName;

    public CardPayment(String paymentId, String userId, double amount, String status, String date, String cardNumber, String cardHolderName) {
        super(paymentId, userId, amount, status, date);
        this.cardNumber = cardNumber;
        this.cardHolderName = cardHolderName;
    }

    @Override
    public String processPayment() {
        return "Processing Card Payment of $" + getAmount() + " using card ending in " + cardNumber.substring(cardNumber.length() - 4);
    }
}