package model;

import java.util.Date;

/** Khách hàng — kế thừa Member */
public class Customer extends Member {
    private int customerid;

    public Customer() {}

    public Customer(int id, String username, String password, String name, Date dob, String email, String phone, int customerid) {
        super(id, username, password, name, dob, email, phone);
        this.customerid = customerid;
    }

    public int getCustomerid() { return customerid; }
    public void setCustomerid(int customerid) { this.customerid = customerid; }
}
