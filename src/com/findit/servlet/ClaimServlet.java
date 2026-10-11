package com.findit.servlet;

import com.findit.dao.ClaimDAO;
import com.findit.model.Claim;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/claimItem")
public class ClaimServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get Item ID
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int lostItemId = Integer.parseInt(request.getParameter("lostItemId"));

        // Get Proof
        String proof = request.getParameter("proof");

        // Debug Messages
        System.out.println("========== CLAIM DEBUG ==========");
        System.out.println("Item ID = " + itemId);
        System.out.println("User ID = " + userId);
        System.out.println("Proof = " + proof);
        System.out.println("=================================");

        // Create Claim Object
        Claim claim = new Claim();
        claim.setFoundItemId(itemId);
        claim.setLostItemId(lostItemId);
        claim.setClaimantId(userId);
        claim.setProof(proof);

        // Save Claim
        ClaimDAO dao = new ClaimDAO();
        boolean status = dao.submitClaim(claim);

        response.setContentType("text/html");

        if (status) {

            response.getWriter().println(
                    "<script>" +
                            "alert('✅ Claim Submitted Successfully!');" +
                            "window.location='search.jsp';" +
                            "</script>"
            );

        } else {

            response.getWriter().println(
                    "<script>" +
                            "alert('❌ Failed to Submit Claim!');" +
                            "history.back();" +
                            "</script>"
            );
        }
    }
}