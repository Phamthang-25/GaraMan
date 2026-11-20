package model;

import java.util.Date;

public class Technician extends Staff {
    public Technician() {}
    public Technician(int id, String username, String password, String name, Date dob, String email, String phone, String position, String status) {
        super(id, username, password, name, dob, email, phone, position, status);
    }
}
