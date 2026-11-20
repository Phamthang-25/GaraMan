package model;

import java.util.Date;

/** Thống kê phụ tùng theo doanh thu */
public class ProductStatistic implements ItemStatistic {
    private int productid;
    private String productname;
    private int soldcount;
    private double total;
    private int invoiceid;
    private Date createat;
    private int customerid;
    private String customername;

    public ProductStatistic() {}

    public ProductStatistic(int productid, String productname, int soldcount, double total, int invoiceid, Date createat, int customerid, String customername) {
        this.productid = productid;
        this.productname = productname;
        this.soldcount = soldcount;
        this.total = total;
        this.invoiceid = invoiceid;
        this.createat = createat;
        this.customerid = customerid;
        this.customername = customername;
    }

    @Override public int getSoldcount() { return soldcount; }
    @Override public double getTotal() { return total; }
    @Override public int getInvoiceid() { return invoiceid; }
    @Override public String getCustomername() { return customername; }

    public int getProductid() { return productid; }
    public void setProductid(int productid) { this.productid = productid; }

    public String getProductname() { return productname; }
    public void setProductname(String productname) { this.productname = productname; }

    public void setSoldcount(int soldcount) { this.soldcount = soldcount; }
    public void setTotal(double total) { this.total = total; }

    public void setInvoiceid(int invoiceid) { this.invoiceid = invoiceid; }

    public Date getCreateat() { return createat; }
    public void setCreateat(Date createat) { this.createat = createat; }

    public int getCustomerid() { return customerid; }
    public void setCustomerid(int customerid) { this.customerid = customerid; }

    public void setCustomername(String customername) { this.customername = customername; }
}
