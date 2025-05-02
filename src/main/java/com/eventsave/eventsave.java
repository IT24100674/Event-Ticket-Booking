package com.eventsave;

import com.utils.WriteM;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Paths;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
        maxFileSize = 1024 * 1024 * 10,       // 10MB
        maxRequestSize = 1024 * 1024 * 15     // 15MB
)
@WebServlet("/createevent")
public class eventsave extends HttpServlet {
    private static final String FILE_PATH = "D:\\SLIIT\\2nd SEM\\OOP\\project\\pro\\src\\main\\database\\evenPost.txt";
    private static final String IMAGE_UPLOAD_DIR = "D:\\SLIIT\\2nd SEM\\OOP\\project\\pro\\src\\main\\webapp\\images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocation");
        String ticketPrice = request.getParameter("ticketPrice");

        Part filePart = request.getPart("eventImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Save the image if a file was uploaded
        if (fileName != null && !fileName.isEmpty()) {
            File uploads = new File(IMAGE_UPLOAD_DIR);
            if (!uploads.exists()) uploads.mkdirs();

            File file = new File(uploads, fileName);
            filePart.write(file.getAbsolutePath());
        }

        // Save event details (including image name)
        String eventDetails = eventName + "," + eventDate + "," + eventLocation + "," + ticketPrice + "," + fileName;
        WriteM.writeToFile(FILE_PATH, eventDetails);

        // Respond
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('Event saved successfully!'); window.location='index.jsp';</script>");
    }
}
