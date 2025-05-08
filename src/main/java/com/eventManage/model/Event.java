package com.eventManage.model;

public class Event {
    private String name;
    private String date;
    private String location;
    private String ticketPrice;
    private String imageName;

    public Event() {}

    public Event(String name, String date, String location, String ticketPrice, String imageName) {
        this.name = name;
        this.date = date;
        this.location = location;
        this.ticketPrice = ticketPrice;
        this.imageName = imageName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(String ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }
}

