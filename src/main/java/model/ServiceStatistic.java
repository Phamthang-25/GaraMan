package model;

import java.util.Date;

/** Thống kê dịch vụ theo doanh thu */
public class ServiceStatistic implements ItemStatistic {
    private int serviceid;
    private String servicename;
    private int soldcount;
    private double total;
    private int invoiceid;
    private Date createat;
    private int customerid;
    private String customername;

    public ServiceStatistic() {}

    public ServiceStatistic(int serviceid, String servicename, int soldcount, double total, int invoiceid, Date createat, int customerid, String customername) {
        this.serviceid = serviceid;
        this.servicename = servicename;
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

    public int getServiceid() { return serviceid; }
    public void setServiceid(int serviceid) { this.serviceid = serviceid; }

    public String getServicename() { return servicename; }
    public void setServicename(String servicename) { this.servicename = servicename; }

    public void setSoldcount(int soldcount) { this.soldcount = soldcount; }
    public void setTotal(double total) { this.total = total; }

    public void setInvoiceid(int invoiceid) { this.invoiceid = invoiceid; }

    public Date getCreateat() { return createat; }
    public void setCreateat(Date createat) { this.createat = createat; }

    public int getCustomerid() { return customerid; }
    public void setCustomerid(int customerid) { this.customerid = customerid; }

    public void setCustomername(String customername) { this.customername = customername; }
}
