package dao;

import model.ProductStatistic;
import java.sql.*;
import java.util.*;

/** Truy vấn thống kê phụ tùng theo doanh thu (PostgreSQL & MySQL compatible) */
public class ProductStatisticDAO {

    public List<ProductStatistic> getByDate(String startDate, String endDate) {
        List<ProductStatistic> list = new ArrayList<>();
        String sql =
            "SELECT p.id AS productid, p.name AS productname, " +
            "       COUNT(d.id) AS soldcount, " +
            "       SUM(d.sellprice * d.quantity) AS total " +
            "FROM tblProductInvoiceDetail d " +
            "JOIN tblProduct p ON p.id = d.tblproductid " +
            "JOIN tblInvoice i ON i.id = d.tblinvoiceid " +
            "WHERE i.createat BETWEEN ? AND ? " +
            "GROUP BY p.id, p.name " +
            "ORDER BY total DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setTimestamp(1, Timestamp.valueOf(startDate + " 00:00:00"));
            ps.setTimestamp(2, Timestamp.valueOf(endDate   + " 23:59:59"));
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductStatistic stat = new ProductStatistic();
                stat.setProductid(rs.getInt("productid"));
                stat.setProductname(rs.getString("productname"));
                stat.setSoldcount(rs.getInt("soldcount"));
                stat.setTotal(rs.getDouble("total"));
                list.add(stat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductStatistic> getUseTime(int productid, String startDate, String endDate) {
        List<ProductStatistic> list = new ArrayList<>();
        String sql =
            "SELECT d.id, p.name AS productname, d.sellprice, d.quantity, " +
            "       i.id AS invoiceid, i.createat, " +
            "       m.id AS customerid, m.name AS customername " +
            "FROM tblProductInvoiceDetail d " +
            "JOIN tblProduct p  ON p.id = d.tblproductid " +
            "JOIN tblInvoice i  ON i.id = d.tblinvoiceid " +
            "JOIN tblCustomer c ON c.customerid = i.tblcustomerid " +
            "JOIN tblMember m   ON m.id = c.customerid " +
            "WHERE d.tblproductid = ? " +
            "  AND i.createat BETWEEN ? AND ? " +
            "ORDER BY i.createat DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, productid);
            ps.setTimestamp(2, Timestamp.valueOf(startDate + " 00:00:00"));
            ps.setTimestamp(3, Timestamp.valueOf(endDate   + " 23:59:59"));
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductStatistic stat = new ProductStatistic();
                stat.setProductid(productid);
                stat.setProductname(rs.getString("productname"));
                stat.setSoldcount(rs.getInt("quantity"));
                stat.setTotal(rs.getDouble("sellprice") * rs.getInt("quantity"));
                stat.setInvoiceid(rs.getInt("invoiceid"));
                stat.setCreateat(rs.getTimestamp("createat"));
                stat.setCustomerid(rs.getInt("customerid"));
                stat.setCustomername(rs.getString("customername"));
                list.add(stat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
