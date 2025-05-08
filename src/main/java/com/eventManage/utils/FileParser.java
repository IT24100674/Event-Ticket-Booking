package com.eventManage.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileParser {

    public static List<String[]> readAndParseFile(String filePath) {
        List<String[]> events = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 4) {
                    events.add(parts);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return events;
    }
}
