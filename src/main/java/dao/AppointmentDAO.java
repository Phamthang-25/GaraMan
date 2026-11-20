package dao;

import model.Appointment;
import java.sql.*;

/** Lưu lịch hẹn mới */
public class AppointmentDAO {

    public boolean addAppointment(Appointment appointment) {
        String sql = "INSERT INTO tblAppointment (tblcustomerid, tblscheduletimeid) VALUES (?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, appointment.getCustomer().getCustomerid());
            ps.setInt(2, appointment.getTime().getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
