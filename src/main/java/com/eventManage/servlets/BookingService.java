package com.eventManage.servlets;

import com.eventManage.model.Booking;
import com.eventManage.model.SeatManager;
import jakarta.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class BookingService {
    private static BookingService instance;
    private List<Booking> bookings;
    private SeatManager seatManager;
    private final String filePath;

    private BookingService(ServletContext context) {
        this.bookings = new ArrayList<>();
        this.seatManager = new SeatManager();
        // Use a fixed path for testing to avoid deployment issues
        // Once confirmed working, revert to context.getRealPath("/data/bookings.txt")
        this.filePath = "C:/EventTicketBookingData/bookings.txt";
        // Ensure the directory exists
        File file = new File(filePath);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
            System.out.println("Created directory: " + file.getParentFile().getAbsolutePath());
        }
        loadBookingsFromFile();
        System.out.println("BookingService initialized. File path: " + filePath + ", Initial bookings count: " + bookings.size());
    }

    public static synchronized BookingService getInstance(ServletContext context) {
        if (instance == null) {
            instance = new BookingService(context);
        }
        return instance;
    }

    public void bookTicket(Booking booking) {
        System.out.println("Attempting to book ticket: " + booking);
        if (areSeatsAvailable(booking.getSeatNumbers())) {
            seatManager.reserveSeats(booking.getSeatNumbers());
            bookings.add(booking);
            System.out.println("Booking added to list: " + booking);
            saveBookingsToFile();
            System.out.println("Booking saved to file: " + booking);
        } else {
            throw new IllegalStateException("One or more selected seats are not available.");
        }
    }

    public List<Booking> getAllBookings() {
        System.out.println("Fetching all bookings: " + bookings.size() + " bookings found.");
        return new ArrayList<>(bookings);
    }

    public void updateBooking(int bookingId, String newEvent, String newDateTime, List<Integer> newSeatNumbers, double newPrice) {
        Booking booking = findBookingById(bookingId);
        if (booking != null) {
            System.out.println("Updating booking ID: " + bookingId + ", Current booking: " + booking);
            seatManager.releaseSeats(booking.getSeatNumbers());
            if (areSeatsAvailable(newSeatNumbers)) {
                seatManager.reserveSeats(newSeatNumbers);
                booking.setEvent(newEvent);
                booking.setEventDateTime(newDateTime);
                booking.setSeatNumbers(newSeatNumbers);
                booking.setTicketPrice(newPrice);
                saveBookingsToFile();
                System.out.println("Booking updated successfully: " + booking);
            } else {
                seatManager.reserveSeats(booking.getSeatNumbers()); // Rollback reservation
                throw new IllegalStateException("One or more new seats are not available.");
            }
        } else {
            throw new IllegalStateException("Booking not found for ID: " + bookingId);
        }
    }

    public void cancelBooking(int bookingId) {
        Booking booking = findBookingById(bookingId);
        if (booking != null) {
            System.out.println("Canceling booking ID: " + bookingId + ", Current booking: " + booking);
            booking.setStatus("Cancelled");
            seatManager.releaseSeats(booking.getSeatNumbers());
            saveBookingsToFile();
            System.out.println("Booking canceled successfully: " + booking);
        } else {
            throw new IllegalStateException("Booking not found for ID: " + bookingId);
        }
    }

    private boolean areSeatsAvailable(List<Integer> seatNumbers) {
        if (seatNumbers == null || seatNumbers.isEmpty()) {
            return true;
        }
        boolean available = seatNumbers.stream().allMatch(seatManager::isSeatAvailable);
        System.out.println("Seat availability check for " + seatNumbers + ": " + available);
        return available;
    }

    private void loadBookingsFromFile() {
        File file = new File(filePath);
        if (!file.exists()) {
            try {
                file.getParentFile().mkdirs();
                file.createNewFile();
                System.out.println("Created bookings file: " + filePath);
            } catch (IOException e) {
                System.err.println("Error creating bookings file: " + e.getMessage());
                e.printStackTrace();
            }
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            bookings.clear();
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    try {
                        Booking booking = Booking.fromString(line);
                        bookings.add(booking);
                        if ("Active".equals(booking.getStatus())) {
                            seatManager.reserveSeats(booking.getSeatNumbers());
                        }
                        System.out.println("Loaded booking: " + line);
                    } catch (Exception e) {
                        System.err.println("Error parsing booking line: " + line + ", Error: " + e.getMessage());
                    }
                }
            }
            System.out.println("Loaded " + bookings.size() + " bookings from file: " + filePath);
        } catch (IOException e) {
            System.err.println("Error reading bookings file: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void saveBookingsToFile() {
        File file = new File(filePath);
        try {
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
                System.out.println("Created bookings file during save: " + filePath);
            }
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
                for (Booking booking : bookings) {
                    writer.write(booking.toString());
                    writer.newLine();
                    System.out.println("Saved booking to file: " + booking);
                }
                System.out.println("Successfully wrote " + bookings.size() + " bookings to file: " + filePath);
            }
        } catch (IOException e) {
            System.err.println("Error writing to bookings file: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public Booking findBookingById(int bookingId) {
        Booking booking = bookings.stream().filter(b -> b.getBookingId() == bookingId).findFirst().orElse(null);
        System.out.println("Finding booking by ID: " + bookingId + ", Found: " + (booking != null));
        return booking;
    }

    public int getNextBookingId() {
        return bookings.stream()
                .mapToInt(Booking::getBookingId)
                .max()
                .orElse(0) + 1;
    }
}