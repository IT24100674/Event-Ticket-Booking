package com.eventManage.model;

import java.util.List;

public abstract class SeatAvailability {
    protected int totalSeats = 50; // Assuming 50 seats as per the image

    public abstract boolean isSeatAvailable(int seatNumber);
    public abstract List<Integer> getAvailableSeats();
    public abstract void reserveSeats(List<Integer> seatNumbers);
}