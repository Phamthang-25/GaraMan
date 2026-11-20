package model;

import java.util.Date;

/** Nhân viên — kế thừa Member */
public abstract class Staff extends Member {
    private String position;
    private String status;

    public Staff() {}

    public Staff(int id, String username, String password, String name, Date dob, String email, String phone, String position, String status) {
        super(id, username, password, name, dob, email, phone);
        this.position = position;
        this.status = status;
    }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
