package dao;

import java.sql.*;
import model.User;

public class UserDAO {

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM Users WHERE email=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapUser(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }
    
        // Lấy user theo login
    public User getUserByLogin(String login) {
        String sql = "SELECT * FROM Users WHERE login=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, login);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapUser(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM Users WHERE user_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapUser(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public boolean updateUser(User u) {
        String sql = "UPDATE Users SET name=?, email=?, phone=?, account_balance=?, updatedAt=NOW() WHERE user_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPhone());
            ps.setBigDecimal(4, u.getAccountBalance());
            ps.setInt(5, u.getUserId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    private User mapUser(ResultSet rs) throws SQLException {
        User u = new User();
        u.setUserId(rs.getInt("user_id"));
        u.setLogin(rs.getString("login"));
        u.setName(rs.getString("name"));
        u.setEmail(rs.getString("email"));
        u.setPhone(rs.getString("phone"));
        u.setAvatar(rs.getString("avatar"));
        u.setAccountBalance(rs.getBigDecimal("account_balance"));
        u.setFlag(rs.getBoolean("flag"));
        u.setRoleId(rs.getInt("role_id"));
        u.setPassword(rs.getString("password"));
        return u;
    }
    
    public boolean insertUser(User u) {
    String sql = "INSERT INTO Users (login, name, email, phone, password, role_id, account_balance, flag, createdAt, updatedAt) VALUES (?,?,?,?,?,?,?,?,NOW(),NOW())";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, u.getLogin());
        ps.setString(2, u.getName());
        ps.setString(3, u.getEmail());
        ps.setString(4, u.getPhone());
        ps.setString(5, u.getPassword());
        ps.setInt(6, u.getRoleId());
        ps.setBigDecimal(7, u.getAccountBalance());
        ps.setBoolean(8, u.isFlag());
        return ps.executeUpdate() > 0;
    } catch(SQLException e){ e.printStackTrace(); }
    return false;
}
    
    

}
