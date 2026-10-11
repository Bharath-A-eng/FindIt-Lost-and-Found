package com.findit.dao;

import com.findit.model.LostItem;
import com.findit.util.DBConnection;
import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class LostItemDAO {

    public boolean reportLostItem(LostItem item) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO lost_items(user_id,item_name,category,description,location,lost_date,image_path) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, item.getUserId());
            ps.setString(2, item.getItemName());
            ps.setString(3, item.getCategory());
            ps.setString(4, item.getDescription());
            ps.setString(5, item.getLocation());
            ps.setString(6, item.getLostDate());
            ps.setString(7, item.getImagePath());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public ResultSet getUserLostItems(int userId) {

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM lost_items WHERE user_id=? ORDER BY id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    public ResultSet getAllLostItems() {

        ResultSet rs = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM lost_items ORDER BY id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }
}

