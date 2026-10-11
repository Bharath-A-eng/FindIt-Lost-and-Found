package com.findit.dao;

import com.findit.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SearchDAO {

    // Search Lost and Found Items
    public ResultSet searchItems(String keyword) {

        ResultSet rs = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT id, item_name, category, location, lost_date AS date, image_path, 'Lost' AS status " +
                            "FROM lost_items " +
                            "WHERE (item_name LIKE ? OR category LIKE ? OR location LIKE ?) " +

                            "UNION ALL " +

                            "SELECT id, item_name, category, location, found_date AS date, image_path, 'Found' AS status " +
                            "FROM found_items " +
                            "WHERE status='Found' " +
                            "AND (item_name LIKE ? OR category LIKE ? OR location LIKE ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            String value = "%" + keyword + "%";

            ps.setString(1, value);
            ps.setString(2, value);
            ps.setString(3, value);

            ps.setString(4, value);
            ps.setString(5, value);
            ps.setString(6, value);

            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }


    // Get Logged-in User's Lost Reports
    public ResultSet getUserLostReports(int userId) {

        ResultSet rs = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT id, item_name " +
                            "FROM lost_items " +
                            "WHERE user_id=? AND status='Lost' " +
                            "ORDER BY id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

}