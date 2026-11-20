package model;

/** Chi tiết dịch vụ trong hóa đơn */
public class ServiceInvoiceDetail {
    private int id;
    private double sellprice;
    private int quantity;
    private Invoice invoice;
    private Service service;

    public ServiceInvoiceDetail() {}

    public ServiceInvoiceDetail(int id, double sellprice, int quantity, Invoice invoice, Service service) {
        this.id = id;
        this.sellprice = sellprice;
        this.quantity = quantity;
        this.invoice = invoice;
        this.service = service;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public double getSellprice() { return sellprice; }
    public void setSellprice(double sellprice) { this.sellprice = sellprice; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public Invoice getInvoice() { return invoice; }
    public void setInvoice(Invoice invoice) { this.invoice = invoice; }

    public Service getService() { return service; }
    public void setService(Service service) { this.service = service; }

    public double getTotal() { return sellprice * quantity; }
}
