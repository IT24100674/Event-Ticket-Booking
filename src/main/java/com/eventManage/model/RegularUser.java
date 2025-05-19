package com.eventManage.model;

public class RegularUser extends User {
    public RegularUser(String username, String email, String password) {
        super(username, email, password);
    }

    //override(User)
    public String getRole() {
        return "Regular User";
    }
}
