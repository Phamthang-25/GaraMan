package servlet;

import dao.*;
import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Module 2: Xem danh sách các lần sử dụng dịch vụ / phụ tùng.
 */
public class RevenueDetailStatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String type      = req.getParameter("type");
        String itemId    = req.getParameter("itemId");
        String itemName  = req.getParameter("itemName");
        String startDate = req.getParameter("startDate");
        String endDate   = req.getParameter("endDate");

        if (type != null && itemId != null) {
            int id = Integer.parseInt(itemId);

            if ("service".equalsIgnoreCase(type)) {
                ServiceStatisticDAO dao = new ServiceStatisticDAO();
                List<ServiceStatistic> detail = dao.getUseTime(id, startDate, endDate);
                req.setAttribute("detailList", detail);
            } else if ("product".equalsIgnoreCase(type)) {
                ProductStatisticDAO dao = new ProductStatisticDAO();
                List<ProductStatistic> detail = dao.getUseTime(id, startDate, endDate);
                req.setAttribute("detailList", detail);
            }
        }

        req.setAttribute("type", type);
        req.setAttribute("itemId", itemId);
        req.setAttribute("itemName", itemName);
        req.setAttribute("startDate", startDate);
        req.setAttribute("endDate", endDate);

        req.getRequestDispatcher("/manager/RevenueDetailStatView.jsp").forward(req, resp);
    }
}
