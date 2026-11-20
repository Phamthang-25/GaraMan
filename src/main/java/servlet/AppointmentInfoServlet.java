package servlet;

import dao.*;
import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Module 1: Xác nhận và lưu lịch hẹn.
 */
public class AppointmentInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String scheduleTimeId = req.getParameter("scheduleTimeId");
        if (scheduleTimeId == null) {
            resp.sendRedirect(req.getContextPath() + "/addAppointment");
            return;
        }

        ScheduleTimeDAO stDAO = new ScheduleTimeDAO();
        ScheduleTime st = stDAO.findById(Integer.parseInt(scheduleTimeId));

        req.setAttribute("selectedSlot", st);
        req.getRequestDispatcher("/customer/AppointmentInfoView.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Customer customer = (Customer) session.getAttribute("member");

        int scheduleTimeId = Integer.parseInt(req.getParameter("scheduleTimeId"));

        ScheduleTimeDAO stDAO = new ScheduleTimeDAO();
        ScheduleTime st = stDAO.findById(scheduleTimeId);

        Appointment appointment = new Appointment();
        appointment.setCustomer(customer);
        appointment.setTime(st);

        AppointmentDAO apDAO = new AppointmentDAO();
        boolean success = apDAO.addAppointment(appointment);

        if (success) {
            stDAO.changeStatus(scheduleTimeId);
            req.setAttribute("message", "Đặt lịch hẹn thành công!");
        } else {
            req.setAttribute("message", "Có lỗi xảy ra, vui lòng thử lại sau.");
        }

        req.setAttribute("selectedSlot", st);
        req.getRequestDispatcher("/customer/AppointmentInfoView.jsp").forward(req, resp);
    }
}
