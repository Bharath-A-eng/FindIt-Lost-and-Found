package com.findit.servlet;

import com.findit.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/approveClaim")
public class ApproveClaimServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int claimId = Integer.parseInt(request.getParameter("id"));

        Connection con = null;

        try {

            con = DBConnection.getConnection();

            con.setAutoCommit(false);

            // Get Found Item ID and Lost Item ID
            String getClaim =
                    "SELECT found_item_id, lost_item_id " +
                            "FROM claims WHERE id=?";

            PreparedStatement ps1 = con.prepareStatement(getClaim);

            ps1.setInt(1, claimId);

            ResultSet rs = ps1.executeQuery();

            if(rs.next()){

                int foundItemId = rs.getInt("found_item_id");
                int lostItemId = rs.getInt("lost_item_id");

                // 1. Approve Claim
                PreparedStatement ps2 = con.prepareStatement(
                        "UPDATE claims SET status='Approved' WHERE id=?"
                );

                ps2.setInt(1, claimId);

// 2. Mark Found Item as Claimed
                PreparedStatement ps3 = con.prepareStatement(
                        "UPDATE found_items SET status='Claimed' WHERE id=?"
                );

                ps3.setInt(1, foundItemId);

// 3. Mark Lost Item as Found
                PreparedStatement ps4 = con.prepareStatement(
                        "UPDATE lost_items SET status='Found',  found_date=CURDATE() WHERE id=?"
                );

                ps4.setInt(1, lostItemId);

// Execute Updates
                int claimRows = ps2.executeUpdate();
                int foundRows = ps3.executeUpdate();
                int lostRows = ps4.executeUpdate();

// Debug Output
                System.out.println("Claim ID = " + claimId);
                System.out.println("Found Item ID = " + foundItemId);
                System.out.println("Lost Item ID = " + lostItemId);

                System.out.println("Claim Updated = " + claimRows);
                System.out.println("Found Updated = " + foundRows);
                System.out.println("Lost Updated = " + lostRows);

                con.commit();

            }else{

                con.rollback();

            }

        } catch (Exception e) {

            try{
                if(con!=null){
                    con.rollback();
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }

            e.printStackTrace();

        } finally {

            try{
                if(con!=null){
                    con.setAutoCommit(true);
                    con.close();
                }
            }catch(Exception e){
                e.printStackTrace();
            }

        }

        response.sendRedirect("viewClaims.jsp");
    }
}