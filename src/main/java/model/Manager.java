package model;

import java.util.Date;

public class Manager extends Staff {
    public Manager() {}
    public Manager(int id, String username, String password, String name, Date dob, String email, String phone, String position, String status) {
        super(id, username, password, name, dob, email, phone, position, status);
    }
}
