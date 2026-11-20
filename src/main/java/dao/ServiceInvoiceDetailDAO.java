package dao;

import model.*;
import java.sql.*;
import java.util.*;

/** Truy vấn chi tiết dịch vụ trong hóa đơn */
public class ServiceInvoiceDetailDAO {

    public List<ServiceInvoiceDetail> getAllByInvoice(Invoice invoice) {
        List<ServiceInvoiceDetail> list = new ArrayList<>();
        if (invoice == null) return list;

        String sql =
            "SELECT d.*, s.name AS servicename " +
            "FROM tblServiceInvoiceDetail d " +
            "JOIN tblService s ON s.id = d.tblserviceid " +
            "WHERE d.tblinvoiceid = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, invoice.getId());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ServiceInvoiceDetail detail = new ServiceInvoiceDetail();
                detail.setId(rs.getInt("id"));
                detail.setSellprice(rs.getDouble("sellprice"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setInvoice(invoice);

                Service s = new Service();
                s.setId(rs.getInt("tblserviceid"));
                s.setName(rs.getString("servicename"));
                detail.setService(s);

                list.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
