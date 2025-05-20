
package com.eventManage.utils;

import com.eventManage.model.Event;
import java.io.*;
import java.util.*;

public class ReadF {
    public static List<Event> readFile(String filePath) {
        List<Event> events = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 6) {
                    Event event = new Event(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
                    events.add(event);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return events;
    }
}

