package com.eventManage.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SeatManager {
    private Set<Integer> reservedSeats;

    public SeatManager() {
        this.reservedSeats = new HashSet<>();
    }

    public boolean isSeatAvailable(int seatNumber) {
        return !reservedSeats.contains(seatNumber);
    }

    public void reserveSeats(List<Integer> seatNumbers) {
        if (seatNumbers != null) {
            reservedSeats.addAll(seatNumbers);
        }
    }

    public void releaseSeats(List<Integer> seatNumbers) {
        if (seatNumbers != null) {
            reservedSeats.removeAll(seatNumbers);
        }
    }
}