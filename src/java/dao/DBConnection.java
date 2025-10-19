package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/taphoaMMO";
    private static final String USER = "root";
    private static final String PASSWORD = "12345678"; // dien mat khau

    public static Connection getConnection() throws SQLException {
        try {
            //load driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found!", e);
        }
    }
}
