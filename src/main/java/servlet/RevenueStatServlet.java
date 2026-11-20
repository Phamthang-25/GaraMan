package servlet;

import dao.*;
import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Module 2: Thống kê doanh thu theo dịch vụ / phụ tùng.
 */
public class RevenueStatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String type      = req.getParameter("type");
        String startDate = req.getParameter("startDate");
        String endDate   = req.getParameter("endDate");

        if (type != null && startDate != null && endDate != null) {
            if ("service".equalsIgnoreCase(type)) {
                ServiceStatisticDAO dao = new ServiceStatisticDAO();
                List<ServiceStatistic> result = dao.getByDate(startDate, endDate);
                req.setAttribute("statList", result);
            } else if ("product".equalsIgnoreCase(type)) {
                ProductStatisticDAO dao = new ProductStatisticDAO();
                List<ProductStatistic> result = dao.getByDate(startDate, endDate);
                req.setAttribute("statList", result);
            }

            req.setAttribute("type", type);
            req.setAttribute("startDate", startDate);
            req.setAttribute("endDate", endDate);
        }

        req.getRequestDispatcher("/manager/RevenueStatView.jsp").forward(req, resp);
    }
}
