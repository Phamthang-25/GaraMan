package dao;

import model.*;
import java.sql.*;
import java.util.*;

/** Truy vấn chi tiết phụ tùng trong hóa đơn */
public class ProductInvoiceDetailDAO {

    public List<ProductInvoiceDetail> getAllByInvoice(Invoice invoice) {
        List<ProductInvoiceDetail> list = new ArrayList<>();
        if (invoice == null) return list;

        String sql =
            "SELECT d.*, p.name AS productname " +
            "FROM tblProductInvoiceDetail d " +
            "JOIN tblProduct p ON p.id = d.tblproductid " +
            "WHERE d.tblinvoiceid = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, invoice.getId());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductInvoiceDetail detail = new ProductInvoiceDetail();
                detail.setId(rs.getInt("id"));
                detail.setSellprice(rs.getDouble("sellprice"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setInvoice(invoice);

                Product p = new Product();
                p.setId(rs.getInt("tblproductid"));
                p.setName(rs.getString("productname"));
                detail.setProduct(p);

                list.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
