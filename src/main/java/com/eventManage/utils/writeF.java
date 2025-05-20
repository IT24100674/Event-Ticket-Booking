
package com.eventManage.utils;

import com.eventManage.model.Event;
import java.io.FileWriter;
import java.io.IOException;

public class writeF {
    public static void writeToFile(String filePath, Event event) {
        try (FileWriter writer = new FileWriter(filePath, true)) {
            writer.write(event.getName() + "," +
                    event.getDate() + "," +
                    event.getLocation() + "," +
                    event.getTicketPrice() + "," +
                    event.getImageName() + "," +
                    event.getTicketQuantity() + "\n");
            System.out.println("Data written to file successfully!");
        } catch (IOException e) {
            System.out.println("Error writing to file: " + e.getMessage());
        }
    }
}

