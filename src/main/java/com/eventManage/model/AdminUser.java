package com.eventManage.model;

public class AdminUser extends User {
    public AdminUser(String username, String email, String password) {
        super(username, email, password);
    }


    public String getRole() {

        return "Admin";
    }
}