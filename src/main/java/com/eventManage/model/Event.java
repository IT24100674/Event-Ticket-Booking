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

    public String getLocation() {
        return location;
    }

    public String getTicketPrice() {
        return ticketPrice;
    }

    public String getImageName() {
        return imageName;
    }
}

