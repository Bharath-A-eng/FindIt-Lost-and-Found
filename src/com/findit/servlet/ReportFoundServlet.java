package com.findit.servlet;

import com.findit.dao.FoundItemDAO;
import com.findit.model.FoundItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet("/reportFound")
@MultipartConfig
public class ReportFoundServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Integer adminId = (Integer) session.getAttribute("adminId");

        if (adminId == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String itemName = request.getParameter("itemName");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String foundDate = request.getParameter("foundDate");

        // Upload Photo
        Part photoPart = request.getPart("photo");

        String fileName = photoPart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("")
                + File.separator + "uploads";

        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        photoPart.write(uploadPath + File.separator + fileName);

        String imagePath = "uploads/" + fileName;

        // Create Object
        FoundItem item = new FoundItem();

        // Admin is reporting the item
        item.setUserId(adminId);

        item.setItemName(itemName);
        item.setCategory(category);
        item.setDescription(description);
        item.setLocation(location);
        item.setFoundDate(foundDate);
        item.setImagePath(imagePath);

        FoundItemDAO dao = new FoundItemDAO();

        boolean status = dao.reportFoundItem(item);

        if (status) {

            response.setContentType("text/html");

            response.getWriter().println(
                    "<script>" +
                            "alert('✅ Report Found Item Submitted Successfully!');" +
                            "window.location='adminDashboard.jsp';" +
                            "</script>"
            );

        } else {

            response.setContentType("text/html");

            response.getWriter().println(
                    "<script>" +
                            "alert('❌ Failed to Report Found Item!');" +
                            "history.back();" +
                            "</script>"
            );
        }
    }
}