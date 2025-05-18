
package com.eventManage.servlets;

import com.eventManage.model.Event;
import com.eventManage.utils.WriteM;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.file.Paths;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 15
)
@WebServlet("/createevent")
public class eventsave extends HttpServlet {
    private static final String FILE_PATH = "C:\\Users\\MSI\\Desktop\\final project\\Event-Ticket-Booking\\src\\main\\database\\evenPost.txt";
    private static final String IMAGE_UPLOAD_DIR = "C:\\Users\\MSI\\Desktop\\final project\\Event-Ticket-Booking\\src\\main\\webapp\\images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocation");
        String ticketPrice = request.getParameter("ticketPrice");

        Part filePart = request.getPart("eventImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        if (fileName != null && !fileName.isEmpty()) {
            File uploads = new File(IMAGE_UPLOAD_DIR);
            if (!uploads.exists()) uploads.mkdirs();

            File file = new File(uploads, fileName);
            filePart.write(file.getAbsolutePath());
        }

        Event event = new Event(eventName, eventDate, eventLocation, ticketPrice, fileName);
        WriteM.writeToFile(FILE_PATH, event);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('Event saved successfully!'); window.location='index.jsp';</script>");
    }
}
