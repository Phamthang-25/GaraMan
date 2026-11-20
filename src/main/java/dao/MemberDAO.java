package dao;

import model.*;
import java.sql.*;

/** Xác thực đăng nhập */
public class MemberDAO {

    public static Member login(String username, String password) {
        String sql = "SELECT * FROM tblMember WHERE username=? AND password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String role = rs.getString("role");
                Date dob = rs.getDate("dob");

                if ("CUSTOMER".equalsIgnoreCase(role)) {
                    Customer c = new Customer();
                    c.setId(id);
                    c.setUsername(username);
                    c.setName(name);
                    c.setEmail(email);
                    c.setPhone(phone);
                    c.setDob(dob);
                    c.setCustomerid(id);
                    return c;
                } else if ("MANAGER".equalsIgnoreCase(role)) {
                    Manager m = new Manager();
                    m.setId(id);
                    m.setUsername(username);
                    m.setName(name);
                    m.setEmail(email);
                    m.setPhone(phone);
                    m.setDob(dob);
                    return m;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
