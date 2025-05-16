package com.example.admin;

public class Admin {
    private String username;
    private String email;
    private String password;
    private String role;

    public Admin(String username, String email, String password, String role) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public String toFileString() {
        return username + "," + email + "," + password + "," + role;
    }

    public static Admin fromFileString(String line) {
        String[] parts = line.split(",");
        return new Admin(parts[0], parts[1], parts[2], parts[3]);
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getRole() {
        return role;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(String role) {
        this.role = role;
    }
}

