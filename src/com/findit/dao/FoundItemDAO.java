package com.findit.dao;

import com.findit.model.FoundItem;
import com.findit.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FoundItemDAO {

    // Insert Found Item
    public boolean reportFoundItem(FoundItem item) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO found_items(user_id,item_name,category,description,location,found_date,image_path) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, item.getUserId());
            ps.setString(2, item.getItemName());
            ps.setString(3, item.getCategory());
            ps.setString(4, item.getDescription());
            ps.setString(5, item.getLocation());
            ps.setString(6, item.getFoundDate());
            ps.setString(7, item.getImagePath());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // Get Found Items of Logged-in User
    public ResultSet getUserFoundItems(int userId) {

        ResultSet rs = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM found_items WHERE user_id=? ORDER BY id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

}