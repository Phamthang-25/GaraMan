package model;

/**
 * Interface thống kê — được implement bởi ServiceStatistic và ProductStatistic.
 */
public interface ItemStatistic {
    int getSoldcount();
    double getTotal();
    int getInvoiceid();
    String getCustomername();
}
