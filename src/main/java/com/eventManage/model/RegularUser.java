package com.eventManage.model;

public class RegularUser extends User {
    public RegularUser(String username, String email, String password) {
        super(username, email, password);
    }


    public String getRole() {
        return "Regular User";
    }
}
