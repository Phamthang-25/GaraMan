package servlet;

import dao.*;
import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Module 2: Xem hóa đơn chi tiết.
 */
public class InvoiceViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String invoiceIdStr = req.getParameter("invoiceId");
        if (invoiceIdStr == null) {
            resp.sendRedirect(req.getContextPath() + "/revenueStat");
            return;
        }

        int invoiceId = Integer.parseInt(invoiceIdStr);

        InvoiceDAO invoiceDAO = new InvoiceDAO();
        Invoice invoice = invoiceDAO.getByInvoiceId(invoiceId);

        ServiceInvoiceDetailDAO sDAO = new ServiceInvoiceDetailDAO();
        List<ServiceInvoiceDetail> services = sDAO.getAllByInvoice(invoice);

        ProductInvoiceDetailDAO pDAO = new ProductInvoiceDetailDAO();
        List<ProductInvoiceDetail> products = pDAO.getAllByInvoice(invoice);

        req.setAttribute("invoice", invoice);
        req.setAttribute("services", services);
        req.setAttribute("products", products);

        req.getRequestDispatcher("/manager/InvoiceView.jsp").forward(req, resp);
    }
}
