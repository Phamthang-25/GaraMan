package model;

/** Chi tiết phụ tùng trong hóa đơn */
public class ProductInvoiceDetail {
    private int id;
    private double sellprice;
    private int quantity;
    private Invoice invoice;
    private Product product;

    public ProductInvoiceDetail() {}

    public ProductInvoiceDetail(int id, double sellprice, int quantity, Invoice invoice, Product product) {
        this.id = id;
        this.sellprice = sellprice;
        this.quantity = quantity;
        this.invoice = invoice;
        this.product = product;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public double getSellprice() { return sellprice; }
    public void setSellprice(double sellprice) { this.sellprice = sellprice; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public Invoice getInvoice() { return invoice; }
    public void setInvoice(Invoice invoice) { this.invoice = invoice; }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }

    public double getTotal() { return sellprice * quantity; }
}
