package com.example.admin;

import jakarta.servlet.ServletContext;
import java.io.*;
import java.util.*;

public class FileUtil {

    public static List<Admin> readAdmins(ServletContext context) throws IOException {
        List<Admin> admins = new ArrayList<>();
        String filePath = context.getRealPath("/admins.txt");

        File file = new File(filePath);
        if (!file.exists()) return admins;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                admins.add(Admin.fromFileString(line));
            }
        }
        return admins;
    }

    public static void writeAdmins(List<Admin> admins, ServletContext context) throws IOException {
        String filePath = context.getRealPath("/admins.txt");

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Admin admin : admins) {
                writer.write(admin.toFileString());
                writer.newLine();
            }
        }
    }

    public static void addAdmin(Admin admin, ServletContext context) throws IOException {
        String filePath = context.getRealPath("/admins.txt");

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(admin.toFileString());
            writer.newLine();
        }
    }

    public static void deleteAdmin(String username, ServletContext context) throws IOException {
        List<Admin> admins = readAdmins(context);
        admins.removeIf(admin -> admin.getUsername().equals(username));
        writeAdmins(admins, context);
    }
}
