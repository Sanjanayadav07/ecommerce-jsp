package com.ecommerce.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.connection.DBConnection;
import com.ecommerce.model.Order;
import com.ecommerce.model.Product;

public class OrderDAO {

    // Place Order
    public boolean placeOrder(int userId, String name, String address, List<Product> cart) {
        boolean success = false;
        String sql = "INSERT INTO orders(user_id, product_id, product_name, price, quantity, customer_name, address) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            for (Product p : cart) {
                stmt.setInt(1, userId);
                stmt.setInt(2, p.getId());
                stmt.setString(3, p.getName());
                stmt.setDouble(4, p.getPrice());
                stmt.setInt(5, 1); // quantity = 1
                stmt.setString(6, name);
                stmt.setString(7, address);
                stmt.addBatch();
            }

            int[] result = stmt.executeBatch();
            success = result.length == cart.size();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    // Get Orders by User ID
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("user_id"));
                o.setProductId(rs.getInt("product_id"));
                o.setProductName(rs.getString("product_name"));
                o.setPrice(rs.getDouble("price"));
                o.setQuantity(rs.getInt("quantity"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setAddress(rs.getString("address"));
                o.setOrderDate(rs.getTimestamp("order_date"));

                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    //get admin id 
  
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY order_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("user_id"));
                o.setProductId(rs.getInt("product_id"));
                o.setProductName(rs.getString("product_name"));
                o.setPrice(rs.getDouble("price"));
                o.setQuantity(rs.getInt("quantity"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setAddress(rs.getString("address"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}



