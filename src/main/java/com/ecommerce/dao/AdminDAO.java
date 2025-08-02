package com.ecommerce.dao;

import java.sql.*;
import com.ecommerce.connection.DBConnection;
import com.ecommerce.model.Admin;

public class AdminDAO {

    public Admin login(String username, String password) {
        Admin admin = null;
        String sql = "SELECT * FROM admins WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}


