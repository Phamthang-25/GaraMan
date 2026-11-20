package dao;

import model.ServiceStatistic;
import java.sql.*;
import java.util.*;

/** Truy vấn thống kê dịch vụ theo doanh thu (PostgreSQL & MySQL compatible) */
public class ServiceStatisticDAO {

    public List<ServiceStatistic> getByDate(String startDate, String endDate) {
        List<ServiceStatistic> list = new ArrayList<>();
        String sql =
            "SELECT s.id AS serviceid, s.name AS servicename, " +
            "       COUNT(d.id) AS soldcount, " +
            "       SUM(d.sellprice * d.quantity) AS total " +
            "FROM tblServiceInvoiceDetail d " +
            "JOIN tblService s ON s.id = d.tblserviceid " +
            "JOIN tblInvoice i ON i.id = d.tblinvoiceid " +
            "WHERE i.createat BETWEEN ? AND ? " +
            "GROUP BY s.id, s.name " +
            "ORDER BY total DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setTimestamp(1, Timestamp.valueOf(startDate + " 00:00:00"));
            ps.setTimestamp(2, Timestamp.valueOf(endDate   + " 23:59:59"));
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ServiceStatistic stat = new ServiceStatistic();
                stat.setServiceid(rs.getInt("serviceid"));
                stat.setServicename(rs.getString("servicename"));
                stat.setSoldcount(rs.getInt("soldcount"));
                stat.setTotal(rs.getDouble("total"));
                list.add(stat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ServiceStatistic> getUseTime(int serviceid, String startDate, String endDate) {
        List<ServiceStatistic> list = new ArrayList<>();
        String sql =
            "SELECT d.id, s.name AS servicename, d.sellprice, d.quantity, " +
            "       i.id AS invoiceid, i.createat, " +
            "       m.id AS customerid, m.name AS customername " +
            "FROM tblServiceInvoiceDetail d " +
            "JOIN tblService s  ON s.id = d.tblserviceid " +
            "JOIN tblInvoice i  ON i.id = d.tblinvoiceid " +
            "JOIN tblCustomer c ON c.customerid = i.tblcustomerid " +
            "JOIN tblMember m   ON m.id = c.customerid " +
            "WHERE d.tblserviceid = ? " +
            "  AND i.createat BETWEEN ? AND ? " +
            "ORDER BY i.createat DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, serviceid);
            ps.setTimestamp(2, Timestamp.valueOf(startDate + " 00:00:00"));
            ps.setTimestamp(3, Timestamp.valueOf(endDate   + " 23:59:59"));
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ServiceStatistic stat = new ServiceStatistic();
                stat.setServiceid(serviceid);
                stat.setServicename(rs.getString("servicename"));
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
