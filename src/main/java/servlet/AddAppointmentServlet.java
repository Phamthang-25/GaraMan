package servlet;

import dao.ScheduleTimeDAO;
import model.ScheduleTime;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Module 1: Hiển thị danh sách khung giờ trống.
 */
public class AddAppointmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ScheduleTimeDAO dao = new ScheduleTimeDAO();
        List<ScheduleTime> freeSlots = dao.getAllFreeScheduleTime();

        req.setAttribute("freeSlots", freeSlots);
        req.getRequestDispatcher("/customer/AddAppointmentView.jsp").forward(req, resp);
    }
}
