-- ============================================================
--  GaraMan Database Script cho PostgreSQL 17
-- ============================================================

DROP TABLE IF EXISTS tblAssignment CASCADE;
DROP TABLE IF EXISTS tblInboundInvoiceDetail CASCADE;
DROP TABLE IF EXISTS tblInboundInvoice CASCADE;
DROP TABLE IF EXISTS tblProductInvoiceDetail CASCADE;
DROP TABLE IF EXISTS tblServiceInvoiceDetail CASCADE;
DROP TABLE IF EXISTS tblInvoice CASCADE;
DROP TABLE IF EXISTS tblService CASCADE;
DROP TABLE IF EXISTS tblProduct CASCADE;
DROP TABLE IF EXISTS tblProvider CASCADE;
DROP TABLE IF EXISTS tblAppointment CASCADE;
DROP TABLE IF EXISTS tblScheduleTime CASCADE;
DROP TABLE IF EXISTS tblTechnician CASCADE;
DROP TABLE IF EXISTS tblWarehouseman CASCADE;
DROP TABLE IF EXISTS tblSales CASCADE;
DROP TABLE IF EXISTS tblManager CASCADE;
DROP TABLE IF EXISTS tblStaff CASCADE;
DROP TABLE IF EXISTS tblCustomer CASCADE;
DROP TABLE IF EXISTS tblMember CASCADE;

-- 1. tblMember
CREATE TABLE tblMember (
    id       SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    name     VARCHAR(100) NOT NULL,
    dob      DATE,
    email    VARCHAR(100),
    phone    VARCHAR(20),
    role     VARCHAR(20) NOT NULL
);

-- 2. tblCustomer
CREATE TABLE tblCustomer (
    customerid INT PRIMARY KEY REFERENCES tblMember(id) ON DELETE CASCADE
);

-- 3. tblStaff
CREATE TABLE tblStaff (
    id       INT PRIMARY KEY REFERENCES tblMember(id) ON DELETE CASCADE,
    position VARCHAR(50),
    status   VARCHAR(20)
);

-- 4. Sub-staff
CREATE TABLE tblManager      (id INT PRIMARY KEY REFERENCES tblStaff(id) ON DELETE CASCADE);
CREATE TABLE tblSales        (id INT PRIMARY KEY REFERENCES tblStaff(id) ON DELETE CASCADE);
CREATE TABLE tblWarehouseman (id INT PRIMARY KEY REFERENCES tblStaff(id) ON DELETE CASCADE);
CREATE TABLE tblTechnician   (id INT PRIMARY KEY REFERENCES tblStaff(id) ON DELETE CASCADE);

-- 5. tblScheduleTime
CREATE TABLE tblScheduleTime (
    id     SERIAL PRIMARY KEY,
    date   DATE NOT NULL,
    start  TIME NOT NULL,
    "end"  TIME NOT NULL,
    status VARCHAR(10) NOT NULL DEFAULT 'FREE'
);

-- 6. tblAppointment
CREATE TABLE tblAppointment (
    id                SERIAL PRIMARY KEY,
    tblcustomerid     INT NOT NULL REFERENCES tblCustomer(customerid),
    tblscheduletimeid INT NOT NULL REFERENCES tblScheduleTime(id)
);

-- 7. tblProvider
CREATE TABLE tblProvider (
    id     SERIAL PRIMARY KEY,
    name   VARCHAR(100) NOT NULL,
    email  VARCHAR(100),
    phone  VARCHAR(20),
    status VARCHAR(20)
);

-- 8. tblProduct
CREATE TABLE tblProduct (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    price       DECIMAL(15,2) NOT NULL,
    description TEXT,
    status      VARCHAR(20)
);

-- 9. tblService
CREATE TABLE tblService (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    price       DECIMAL(15,2) NOT NULL,
    description TEXT,
    status      VARCHAR(20)
);

-- 10. tblInvoice
CREATE TABLE tblInvoice (
    id            SERIAL PRIMARY KEY,
    createat      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    paymentstatus VARCHAR(20),
    tblcustomerid INT REFERENCES tblCustomer(customerid),
    tblsaleid     INT REFERENCES tblSales(id)
);

-- 11. tblServiceInvoiceDetail
CREATE TABLE tblServiceInvoiceDetail (
    id           SERIAL PRIMARY KEY,
    sellprice    DECIMAL(15,2),
    quantity     INT,
    tblinvoiceid INT REFERENCES tblInvoice(id),
    tblserviceid INT REFERENCES tblService(id)
);

-- 12. tblProductInvoiceDetail
CREATE TABLE tblProductInvoiceDetail (
    id           SERIAL PRIMARY KEY,
    sellprice    DECIMAL(15,2),
    quantity     INT,
    tblinvoiceid INT REFERENCES tblInvoice(id),
    tblproductid INT REFERENCES tblProduct(id)
);

-- 13. tblInboundInvoice
CREATE TABLE tblInboundInvoice (
    id                SERIAL PRIMARY KEY,
    createat          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    paymentstatus     VARCHAR(20),
    tblproviderid     INT REFERENCES tblProvider(id),
    tblwarehousemanid INT REFERENCES tblWarehouseman(id)
);

-- 14. tblInboundInvoiceDetail
CREATE TABLE tblInboundInvoiceDetail (
    id                  SERIAL PRIMARY KEY,
    cost                DECIMAL(15,2),
    quantity            INT,
    tblinboundinvoiceid INT REFERENCES tblInboundInvoice(id),
    tblproductid        INT REFERENCES tblProduct(id)
);

-- 15. tblAssignment
CREATE TABLE tblAssignment (
    id              SERIAL PRIMARY KEY,
    note            TEXT,
    tbltechnicianid INT REFERENCES tblTechnician(id),
    tblinvoiceid    INT REFERENCES tblInvoice(id)
);

-- ============================================================
-- DỮ LIỆU MẪU ĐỂ CHẠY VÀ CHỤP ẢNH
-- ============================================================

INSERT INTO tblMember (id, username, password, name, dob, email, phone, role) VALUES
(1, 'customer1', '123456', 'Nguyễn Văn An', '1995-05-10', 'an@email.com', '0901234567', 'CUSTOMER'),
(2, 'manager1',  '123456', 'Trần Thị Bích', '1988-03-20', 'bich@garaman.com', '0912345678', 'MANAGER'),
(3, 'sales1',    '123456', 'Lê Văn Cường',  '1990-07-15', 'cuong@garaman.com', '0923456789', 'SALES');
SELECT setval('tblmember_id_seq', (SELECT MAX(id) FROM tblMember));

INSERT INTO tblCustomer (customerid) VALUES (1);
INSERT INTO tblStaff (id, position, status) VALUES 
(2, 'Manager', 'ACTIVE'),
(3, 'Sales',   'ACTIVE');
INSERT INTO tblManager (id) VALUES (2);
INSERT INTO tblSales   (id) VALUES (3);

INSERT INTO tblScheduleTime (id, date, start, "end", status) VALUES
(1, '2026-11-20', '08:00:00', '09:00:00', 'FREE'),
(2, '2026-11-20', '09:00:00', '10:00:00', 'FREE'),
(3, '2026-11-20', '10:00:00', '11:00:00', 'BOOKED'),
(4, '2026-11-21', '08:00:00', '09:00:00', 'FREE'),
(5, '2026-11-21', '14:00:00', '15:00:00', 'FREE');
SELECT setval('tblscheduletime_id_seq', (SELECT MAX(id) FROM tblScheduleTime));

INSERT INTO tblService (id, name, price, description, status) VALUES
(1, 'Thay dầu động cơ',    500000, 'Thay dầu động cơ định kỳ',    'ACTIVE'),
(2, 'Rửa xe toàn diện',    150000, 'Rửa xe + hút bụi nội thất',   'ACTIVE'),
(3, 'Kiểm tra hệ thống',   200000, 'Kiểm tra toàn bộ hệ thống xe', 'ACTIVE');
SELECT setval('tblservice_id_seq', (SELECT MAX(id) FROM tblService));

INSERT INTO tblProduct (id, name, price, description, status) VALUES
(1, 'Lọc gió',  80000,  'Lọc gió động cơ',           'ACTIVE'),
(2, 'Lọc dầu',  60000,  'Lọc dầu động cơ',            'ACTIVE'),
(3, 'Dầu nhớt', 250000, 'Dầu nhớt tổng hợp 5W-30',   'ACTIVE');
SELECT setval('tblproduct_id_seq', (SELECT MAX(id) FROM tblProduct));

INSERT INTO tblInvoice (id, createat, paymentstatus, tblcustomerid, tblsaleid) VALUES
(1, '2026-11-01 10:00:00', 'PAID', 1, 3),
(2, '2026-11-05 14:00:00', 'PAID', 1, 3),
(3, '2026-11-10 09:00:00', 'PAID', 1, 3);
SELECT setval('tblinvoice_id_seq', (SELECT MAX(id) FROM tblInvoice));

INSERT INTO tblServiceInvoiceDetail (id, sellprice, quantity, tblinvoiceid, tblserviceid) VALUES
(1, 500000, 1, 1, 1),
(2, 150000, 2, 1, 2),
(3, 500000, 1, 2, 1),
(4, 200000, 1, 3, 3);
SELECT setval('tblserviceinvoicedetail_id_seq', (SELECT MAX(id) FROM tblServiceInvoiceDetail));

INSERT INTO tblProductInvoiceDetail (id, sellprice, quantity, tblinvoiceid, tblproductid) VALUES
(1, 80000,  2, 1, 1),
(2, 60000,  1, 2, 2),
(3, 250000, 2, 2, 3),
(4, 80000,  3, 3, 1);
SELECT setval('tblproductinvoicedetail_id_seq', (SELECT MAX(id) FROM tblProductInvoiceDetail));
