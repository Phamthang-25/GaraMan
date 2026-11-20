package model;

/** Lịch hẹn của khách hàng */
public class Appointment {
    private int id;
    private Customer customer;
    private ScheduleTime time;

    public Appointment() {}

    public Appointment(int id, Customer customer, ScheduleTime time) {
        this.id = id;
        this.customer = customer;
        this.time = time;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }

    public ScheduleTime getTime() { return time; }
    public void setTime(ScheduleTime time) { this.time = time; }
}
