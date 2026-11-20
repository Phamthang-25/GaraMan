package model;

import java.util.Date;

public class Sales extends Staff {
    public Sales() {}
    public Sales(int id, String username, String password, String name, Date dob, String email, String phone, String position, String status) {
        super(id, username, password, name, dob, email, phone, position, status);
    }
}
