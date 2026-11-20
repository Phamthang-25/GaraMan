package model;

import java.util.Date;

/** Hóa đơn bán hàng */
public class Invoice {
    private int id;
    private Date createat;
    private String paymentstatus;
    private Customer customer;
    private Sales sale;

    public Invoice() {}

    public Invoice(int id, Date createat, String paymentstatus, Customer customer, Sales sale) {
        this.id = id;
        this.createat = createat;
        this.paymentstatus = paymentstatus;
        this.customer = customer;
        this.sale = sale;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getCreateat() { return createat; }
    public void setCreateat(Date createat) { this.createat = createat; }

    public String getPaymentstatus() { return paymentstatus; }
    public void setPaymentstatus(String paymentstatus) { this.paymentstatus = paymentstatus; }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }

    public Sales getSale() { return sale; }
    public void setSale(Sales sale) { this.sale = sale; }
}
