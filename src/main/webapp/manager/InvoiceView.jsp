<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  if (session.getAttribute("member") == null) {
      response.sendRedirect(request.getContextPath() + "/login.jsp");
      return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>GaraMan — Hóa đơn chi tiết</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark bg-dark px-4 shadow-sm">
  <span class="navbar-brand fw-bold">🔧 GaraMan — Quản Trị</span>
  <div>
    <span class="text-white me-3">Quản lý: <strong>${member.name}</strong></span>
    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm">Đăng xuất</a>
  </div>
</nav>

<div class="container mt-4" style="max-width: 800px;">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/manager/ManagerView.jsp">Trang chủ</a></li>
      <li class="breadcrumb-item"><a href="javascript:history.back()">Chi tiết lần dùng</a></li>
      <li class="breadcrumb-item active">Hóa đơn #${invoice.id}</li>
    </ol>
  </nav>

  <div class="card shadow-sm border-0 mb-4">
    <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center py-3">
      <h5 class="mb-0 fw-bold">🧾 HÓA ĐƠN CHI TIẾT — #${invoice.id}</h5>
      <span class="badge bg-success px-3 py-2">${invoice.paymentstatus}</span>
    </div>
    <div class="card-body p-4">
      <div class="row mb-4">
        <div class="col-6">
          <p class="mb-1 text-muted">Khách hàng:</p>
          <h5 class="fw-bold">${invoice.customer.name}</h5>
        </div>
        <div class="col-6 text-end">
          <p class="mb-1 text-muted">Ngày lập hóa đơn:</p>
          <h6 class="fw-bold"><fmt:formatDate value="${invoice.createat}" pattern="dd/MM/yyyy HH:mm:ss"/></h6>
        </div>
      </div>

      <!-- Danh sách Dịch vụ -->
      <c:if test="${not empty services}">
        <h6 class="fw-bold text-secondary mb-2">1. Dịch vụ sửa chữa / bảo dưỡng</h6>
        <table class="table table-bordered mb-4">
          <thead class="table-light">
            <tr>
              <th style="width: 50px;" class="text-center">#</th>
              <th>Tên dịch vụ</th>
              <th style="width: 90px;" class="text-center">Số lượng</th>
              <th style="width: 130px;" class="text-end">Đơn giá</th>
              <th style="width: 150px;" class="text-end">Thành tiền (VNĐ)</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="s" items="${services}" varStatus="i">
              <tr>
                <td class="text-center">${i.index + 1}</td>
                <td>${s.service.name}</td>
                <td class="text-center">${s.quantity}</td>
                <td class="text-end"><fmt:formatNumber value="${s.sellprice}" type="number"/></td>
                <td class="text-end fw-bold"><fmt:formatNumber value="${s.total}" type="number"/></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>

      <!-- Danh sách Phụ tùng -->
      <c:if test="${not empty products}">
        <h6 class="fw-bold text-secondary mb-2">2. Phụ tùng thay thế</h6>
        <table class="table table-bordered mb-4">
          <thead class="table-light">
            <tr>
              <th style="width: 50px;" class="text-center">#</th>
              <th>Tên phụ tùng</th>
              <th style="width: 90px;" class="text-center">Số lượng</th>
              <th style="width: 130px;" class="text-end">Đơn giá</th>
              <th style="width: 150px;" class="text-end">Thành tiền (VNĐ)</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="p" items="${products}" varStatus="i">
              <tr>
                <td class="text-center">${i.index + 1}</td>
                <td>${p.product.name}</td>
                <td class="text-center">${p.quantity}</td>
                <td class="text-end"><fmt:formatNumber value="${p.sellprice}" type="number"/></td>
                <td class="text-end fw-bold"><fmt:formatNumber value="${p.total}" type="number"/></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>

      <div class="d-flex justify-content-between align-items-center mt-4">
        <a href="javascript:history.back()" class="btn btn-outline-secondary">← Quay lại</a>
        <a href="${pageContext.request.contextPath}/manager/RevenueStatView.jsp" class="btn btn-dark">Về trang thống kê</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>
