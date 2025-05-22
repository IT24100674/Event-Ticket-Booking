package com.eventManage.utils;

import com.eventManage.model.Event;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class EventSorter {
    private static final DateTimeFormatter DATE_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
    

    public static void mergeSort(List<Event> events) {

        if (events == null || events.size() <= 1) {
            return;
        }
        

        int middle = events.size() / 2;
        List<Event> leftHalf = new ArrayList<>(events.subList(0, middle));
        List<Event> rightHalf = new ArrayList<>(events.subList(middle, events.size()));
        

        mergeSort(leftHalf);
        mergeSort(rightHalf);
        

        merge(events, leftHalf, rightHalf);
    }
    

    private static void merge(List<Event> result, List<Event> left, List<Event> right) {
        int leftIndex = 0;
        int rightIndex = 0;
        int resultIndex = 0;
        

        while (leftIndex < left.size() && rightIndex < right.size()) {

            LocalDateTime leftDate = LocalDateTime.parse(left.get(leftIndex).getDate(), DATE_FORMAT);
            LocalDateTime rightDate = LocalDateTime.parse(right.get(rightIndex).getDate(), DATE_FORMAT);
            

            if (leftDate.compareTo(rightDate) <= 0) {
                result.set(resultIndex, left.get(leftIndex));
                leftIndex++;
            } else {
                result.set(resultIndex, right.get(rightIndex));
                rightIndex++;
            }
            resultIndex++;
        }
        

        while (leftIndex < left.size()) {
            result.set(resultIndex, left.get(leftIndex));
            leftIndex++;
            resultIndex++;
        }
        

        while (rightIndex < right.size()) {
            result.set(resultIndex, right.get(rightIndex));
            rightIndex++;
            resultIndex++;
        }
    }
} 