package com.findit.servlet;

import com.findit.dao.LostItemDAO;
import com.findit.model.LostItem;

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

@WebServlet("/reportLost")
@MultipartConfig
public class ReportLostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId =
                (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String itemName =
                request.getParameter("itemName");

        String category =
                request.getParameter("category");

        String description =
                request.getParameter("description");

        String location =
                request.getParameter("location");

        String lostDate =
                request.getParameter("lostDate");

        // Photo Upload
        Part photoPart =
                request.getPart("photo");

        String fileName =
                photoPart.getSubmittedFileName();

        String uploadPath =
                getServletContext().getRealPath("")
                        + File.separator
                        + "uploads";

        File uploadDir =
                new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        photoPart.write(
                uploadPath + File.separator + fileName
        );

        String imagePath =
                "uploads/" + fileName;

        // Create Object
        LostItem item = new LostItem();

        item.setUserId(userId);
        item.setItemName(itemName);
        item.setCategory(category);
        item.setDescription(description);
        item.setLocation(location);
        item.setLostDate(lostDate);
        item.setImagePath(imagePath);

        LostItemDAO dao =
                new LostItemDAO();

        boolean status =
                dao.reportLostItem(item);

        if (status) {

            response.getWriter().println(
                    "<h2>Lost Item Reported Successfully!</h2>"
            );

        } else {

            response.getWriter().println(
                    "<h2>Failed to Report Lost Item!</h2>"
            );
        }
    }
}