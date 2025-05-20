
package com.eventManage.servlets;

import com.eventManage.model.Event;
import com.eventManage.utils.writeF;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.nio.file.Paths;

@MultipartConfig
@WebServlet("/createPost")
public class eventSaveServlet extends HttpServlet {
    private static final String FILE_PATH = "D:\\SLIIT\\2nd SEM\\OOP\\project\\pro\\src\\main\\database\\evenPost.txt";
    private static final String IMAGE_UPLOAD = "D:\\SLIIT\\2nd SEM\\OOP\\project\\pro\\src\\main\\webapp\\images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocation");
        String ticketPrice = request.getParameter("ticketPrice");
        String ticketQuantity = request.getParameter("ticketQuantity");

        Part filePart = request.getPart("eventImage");
        String imageName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        if (imageName != null && !imageName.isEmpty()) {
            File uploads = new File(IMAGE_UPLOAD);
            if (!uploads.exists()) uploads.mkdirs();

            File file = new File(uploads, imageName);
            filePart.write(file.getAbsolutePath());
        }

        Event event = new Event(eventName, eventDate, eventLocation, ticketPrice, imageName, ticketQuantity);
        writeF.writeToFile(FILE_PATH, event);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('Event saved successfully!'); window.location='index.jsp';</script>");
    }
}
