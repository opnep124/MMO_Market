/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.SQLException;
import dao.DBConnection;

public class TestDBConnection {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("✅ Connected to database successfully!");
            } else {
                System.out.println("❌ Failed to connect to database.");
            }
        } catch (SQLException e) {
            System.out.println("❌ Database connection error:");
            e.printStackTrace();
        }
    }
}

