package dao;

import model.ScheduleTime;
import java.sql.*;
import java.util.*;

/** Truy vấn và cập nhật khung giờ hẹn */
public class ScheduleTimeDAO {

    /** Lấy danh sách khung giờ còn trống (status = 'FREE') */
    public List<ScheduleTime> getAllFreeScheduleTime() {
        List<ScheduleTime> list = new ArrayList<>();
        String sql = "SELECT * FROM tblScheduleTime WHERE status = 'FREE' ORDER BY date, start";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ScheduleTime st = new ScheduleTime(
                    rs.getInt("id"),
                    rs.getDate("date"),
                    rs.getTime("start"),
                    rs.getTime("end"),
                    rs.getString("status")
                );
                list.add(st);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /** Đổi trạng thái khung giờ sang BOOKED */
    public void changeStatus(int scheduleTimeId) {
        String sql = "UPDATE tblScheduleTime SET status = 'BOOKED' WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, scheduleTimeId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /** Tìm 1 khung giờ theo id */
    public ScheduleTime findById(int id) {
        String sql = "SELECT * FROM tblScheduleTime WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new ScheduleTime(
                    rs.getInt("id"),
                    rs.getDate("date"),
                    rs.getTime("start"),
                    rs.getTime("end"),
                    rs.getString("status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
