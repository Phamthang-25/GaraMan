package model;

import java.sql.Time;
import java.util.Date;

/** Khung giờ có thể đặt lịch hẹn */
public class ScheduleTime {
    private int id;
    private Date date;
    private Time start;
    private Time end;
    private String status;   // FREE | BOOKED

    public ScheduleTime() {}

    public ScheduleTime(int id, Date date, Time start, Time end, String status) {
        this.id = id;
        this.date = date;
        this.start = start;
        this.end = end;
        this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public Time getStart() { return start; }
    public void setStart(Time start) { this.start = start; }

    public Time getEnd() { return end; }
    public void setEnd(Time end) { this.end = end; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
