package com.eventManage.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class  Booking {
    private int bookingId;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String event;
    private String eventDateTime;
    private List<Integer> seatNumbers;
    private double ticketPrice;
    private String status;

    public Booking(int bookingId, String fullName, String email, String phoneNumber, String event, String eventDateTime,
                   List<Integer> seatNumbers, double ticketPrice, String status) {
        this.bookingId = bookingId;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.event = event;
        this.eventDateTime = eventDateTime;
        this.seatNumbers = seatNumbers != null ? seatNumbers : new ArrayList<>();
        this.ticketPrice = ticketPrice;
        this.status = status != null ? status : "Active";
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public String getEvent() { return event; }
    public void setEvent(String event) { this.event = event; }
    public String getEventDateTime() { return eventDateTime; }
    public void setEventDateTime(String eventDateTime) { this.eventDateTime = eventDateTime; }
    public List<Integer> getSeatNumbers() { return seatNumbers; }
    public void setSeatNumbers(List<Integer> seatNumbers) { this.seatNumbers = seatNumbers; }
    public double getTicketPrice() { return ticketPrice; }
    public void setTicketPrice(double ticketPrice) { this.ticketPrice = ticketPrice; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return String.format("%d,%s,%s,%s,%s,%s,%s,%.2f,%s",
                bookingId, fullName, email, phoneNumber, event, eventDateTime, seatNumbers, ticketPrice, status);
    }

    public static Booking fromString(String line) {
        String[] parts = line.split(",");
        String seatNumbersStr = parts[6].trim();
        List<Integer> seatNumbers = new ArrayList<>();
        if (seatNumbersStr.startsWith("[") && seatNumbersStr.endsWith("]") && !seatNumbersStr.equals("[]")) {
            String[] seatArray = seatNumbersStr.substring(1, seatNumbersStr.length() - 1).split(",");
            seatNumbers = Arrays.stream(seatArray)
                    .map(String::trim)
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());
        }
        return new Booking(
                Integer.parseInt(parts[0].trim()),
                parts[1].trim(),
                parts[2].trim(),
                parts[3].trim(),
                parts[4].trim(),
                parts[5].trim(),
                seatNumbers,
                Double.parseDouble(parts[7].trim()),
                parts.length > 8 ? parts[8].trim() : "Active"
        );
    }
}