package com.findit.dao;

import com.findit.model.Claim;
import com.findit.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ClaimDAO {

    // Submit a new claim
    public boolean submitClaim(Claim claim) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO claims(found_item_id, lost_item_id, claimant_id, proof) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, claim.getFoundItemId());
            ps.setInt(2, claim.getLostItemId());
            ps.setInt(3, claim.getClaimantId());
            ps.setString(4, claim.getProof());

            int rows = ps.executeUpdate();

            if(rows > 0){
                status = true;
            }

            con.close();

        } catch(Exception e){

            System.out.println("========== CLAIM INSERT ERROR ==========");
            e.printStackTrace();
            System.out.println("========================================");

        }

        return status;
    }


    // Get all claims for Admin
    public ResultSet getAllClaims() {

        ResultSet rs = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT c.id, " +
                            "f.item_name, " +
                            "u.name, " +
                            "u.email, " +
                            "c.proof, " +
                            "c.status, " +
                            "c.created_at " +
                            "FROM claims c " +
                            "INNER JOIN found_items f ON c.found_item_id = f.id " +
                            "INNER JOIN users u ON c.claimant_id = u.id " +
                            "ORDER BY c.created_at DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

        } catch(Exception e){

            System.out.println("========== CLAIM FETCH ERROR ==========");
            e.printStackTrace();
            System.out.println("=======================================");

        }

        return rs;
    }
}