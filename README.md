# GaraMan — Hệ Thống Quản Lý Gara Ô Tô

---

## 1. Cấu Trúc Thư Mục Dự Án

```
GaraMan/
├── garaman_postgres.sql               <-- Script tạo CSDL & dữ liệu mẫu cho PostgreSQL 17
├── pom.xml                            <-- Cấu hình Maven dependencies & plugins
├── README.md                          <-- Tài liệu hướng dẫn
├── .gitignore                         <-- Cấu hình bỏ qua file build & file rác
└── src/
    └── main/
        ├── java/
        │   ├── model/                 <-- Các thực thể kế thừa & giao diện chuẩn
        │   │   ├── Member.java
        │   │   ├── Customer.java
        │   │   ├── Staff.java
        │   │   ├── Manager.java, Sales.java, Warehouseman.java, Technician.java
        │   │   ├── ScheduleTime.java, Appointment.java
        │   │   ├── Service.java, Product.java, Invoice.java
        │   │   ├── ServiceInvoiceDetail.java, ProductInvoiceDetail.java
        │   │   ├── ItemStatistic.java
        │   │   ├── ServiceStatistic.java, ProductStatistic.java
        │   │
        │   ├── dao/                   <-- Tầng truy xuất CSDL
        │   │   ├── DBConnection.java 
        │   │   ├── MemberDAO.java
        │   │   ├── ScheduleTimeDAO.java
        │   │   ├── AppointmentDAO.java
        │   │   ├── ServiceStatisticDAO.java, ProductStatisticDAO.java
        │   │   ├── InvoiceDAO.java
        │   │   ├── ServiceInvoiceDetailDAO.java, ProductInvoiceDetailDAO.java
        │   │
        │   └── servlet/               <-- Controller tiếp nhận request và điều hướng
        │       ├── LoginServlet.java, LogoutServlet.java
        │       ├── AddAppointmentServlet.java, AppointmentInfoServlet.java
        │       ├── RevenueStatServlet.java, RevenueDetailStatServlet.java
        │       └── InvoiceViewServlet.java
        │
        └── webapp/                    <-- Giao diện JSP
            ├── WEB-INF/web.xml
            ├── login.jsp              <-- Trang đăng nhập
            ├── customer/
            │   ├── CustomerView.jsp
            │   ├── AddAppointmentView.jsp
            │   └── AppointmentInfoView.jsp
            └── manager/
                ├── ManagerView.jsp
                ├── RevenueStatView.jsp
                ├── RevenueDetailStatView.jsp
                └── InvoiceView.jsp
```

---
