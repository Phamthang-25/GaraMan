# GaraMan — Hệ Thống Quản Lý Gara Ô Tô

Dự án Java Servlet / JSP chuẩn mô hình MVC (DAO - Servlet - JSP) cho Bài Tập Lớn môn Phân Tích & Thiết Kế Hệ Thống Thông Tin (PTTK HTTT) — Đề số 29.

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
        │   │   ├── Member.java (abstract)
        │   │   ├── Customer.java
        │   │   ├── Staff.java (abstract)
        │   │   ├── Manager.java, Sales.java, Warehouseman.java, Technician.java
        │   │   ├── ScheduleTime.java, Appointment.java
        │   │   ├── Service.java, Product.java, Invoice.java
        │   │   ├── ServiceInvoiceDetail.java, ProductInvoiceDetail.java
        │   │   ├── ItemStatistic.java (interface)
        │   │   ├── ServiceStatistic.java, ProductStatistic.java
        │   │
        │   ├── dao/                   <-- Tầng truy xuất CSDL (JDBC PreparedStatement)
        │   │   ├── DBConnection.java  (Kết nối PostgreSQL 17)
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
        └── webapp/                    <-- Giao diện JSP (Bootstrap 5)
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

## 2. Cài Đặt Cơ Sở Dữ Liệu (PostgreSQL 17)

1. Mở công cụ quản lý PostgreSQL (**pgAdmin**, **DBeaver** hoặc lệnh **psql**).
2. Chạy toàn bộ script `garaman_postgres.sql` để tạo các bảng và dữ liệu mẫu:
   ```powershell
   $env:PGPASSWORD="postgres"; & "C:\Program Files\PostgreSQL\17\bin\psql.exe" -U postgres -h 127.0.0.1 -d postgres -f garaman_postgres.sql
   ```
3. Kiểm tra thông tin kết nối trong `src/main/java/dao/DBConnection.java`:
   - URL: `jdbc:postgresql://127.0.0.1:5432/postgres`
   - User: `postgres`
   - Password: `postgres`

---

## 3. Chạy Ứng Dụng

### Cách 1: Chạy bằng dòng lệnh Maven (Jetty Server)
Tại thư mục `GaraMan`:
```bash
mvn jetty:run
```
Sau đó mở trình duyệt tại: `http://localhost:8080/GaraMan/login.jsp`

### Cách 2: Mở trong IDE (IntelliJ IDEA / NetBeans / Eclipse)
1. Mở IDE -> **Open Project** -> Chọn thư mục `GaraMan`.
2. IDE tự nhận diện dự án Maven.
3. Chạy thông qua Tomcat Server hoặc Jetty Plugin có sẵn.

---

## 4. Tài Khoản Đăng Nhập Mẫu

| Vai trò | Tên đăng nhập | Mật khẩu |
| :--- | :--- | :--- |
| **Khách hàng** | `customer1` | `123456` |
| **Quản lý** | `manager1` | `123456` |
