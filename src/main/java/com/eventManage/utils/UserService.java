package com.eventManage.utils;


import com.eventManage.model.*;

import java.io.*;
import java.util.*;

public class UserService implements UserServiceInterface {

    public void registerUser(User user, String filePath) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(user.getUsername() + "," + user.getEmail() + "," + user.getPassword() + "," + user.getRole());
            writer.newLine();
        }
    }

    public User authenticate(String username, String password, String filePath) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.trim().split(",");
                if (parts.length == 4) {
                    String storedUsername = parts[0].trim();
                    String storedEmail = parts[1].trim();
                    String storedPassword = parts[2].trim();
                    String storedRole = parts[3].trim().toLowerCase();  // Clean and normalize role

                    if (storedUsername.equals(username) && storedPassword.equals(password)) {
                        if (storedRole.equals("admin")) {
                            return new AdminUser(storedUsername, storedEmail, storedPassword);
                        } else {
                            return new RegularUser(storedUsername, storedEmail, storedPassword);
                        }
                    }
                }
            }
        }
        return null;
    }


    public boolean updateUser(String username, String newEmail, String newPassword, String filePath) {
        File original = new File(filePath);
        File temp = new File(filePath + ".tmp");
        boolean updated = false;

        try (
                BufferedReader reader = new BufferedReader(new FileReader(original));
                PrintWriter writer = new PrintWriter(new FileWriter(temp))
        ) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 4);
                if (parts.length == 4 && parts[0].equals(username)) {
                    String emailToWrite = (newEmail == null || newEmail.isBlank()) ? parts[1] : newEmail;
                    writer.println(username + "," + emailToWrite + "," + newPassword + "," + parts[3]);
                    updated = true;
                } else {
                    writer.println(line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            temp.delete();
            return false;
        }

        if (updated) {
            if (!original.delete() || !temp.renameTo(original)) {
                System.err.println("Failed to replace users file.");
                temp.delete();
                return false;
            }
        } else {
            temp.delete();
        }

        return updated;
    }


}