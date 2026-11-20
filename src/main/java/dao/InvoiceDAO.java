package dao;

import model.*;
import java.sql.*;

/** Truy vấn hóa đơn */
public class InvoiceDAO {

    public Invoice getByInvoiceId(int invoiceId) {
        String sql =
            "SELECT i.*, m.name AS customername " +
            "FROM tblInvoice i " +
            "JOIN tblCustomer c ON c.customerid = i.tblcustomerid " +
            "JOIN tblMember m   ON m.id = c.customerid " +
            "WHERE i.id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, invoiceId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Invoice inv = new Invoice();
                inv.setId(rs.getInt("id"));
                inv.setCreateat(rs.getTimestamp("createat"));
                inv.setPaymentstatus(rs.getString("paymentstatus"));

                Customer c = new Customer();
                c.setId(rs.getInt("tblcustomerid"));
                c.setName(rs.getString("customername"));
                inv.setCustomer(c);

                return inv;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
