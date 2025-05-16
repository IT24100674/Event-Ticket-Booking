package com.eventManage.servlets;

public class BankTransfer extends Payment {
    private String bankAccountNumber;
    private String bankName;

    public BankTransfer(String paymentId, String userId, double amount, String status, String date, String bankAccountNumber, String bankName) {
        super(paymentId, userId, amount, status, date);
        this.bankAccountNumber = bankAccountNumber;
        this.bankName = bankName;
    }

    @Override
    public String processPayment() {
        return "Processing Bank Transfer of $" + getAmount() + " to " + bankName + " account ending in " + bankAccountNumber.substring(bankAccountNumber.length() - 4);
    }
}