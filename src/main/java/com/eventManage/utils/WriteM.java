package com.eventManage.utils;

import java.io.FileWriter;
import java.io.IOException;

public class WriteM {

    // Generic method to write any data to a specified file
    public static void writeToFile(String filePath, String filecontent) {
        try (FileWriter writer = new FileWriter(filePath,true)) {
            writer.write(filecontent + "\n");
            System.out.println("Data written to file successfully!");
        } catch (IOException e) {
            System.out.println("Error writing to file: " + e.getMessage());
        }
    }
}
