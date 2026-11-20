<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>GaraMan — Trang khách hàng</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark bg-dark px-4 shadow-sm">
  <span class="navbar-brand fw-bold">🔧 GaraMan</span>
  <div>
    <span class="text-white me-3">Xin chào, <strong>${member.name}</strong></span>
    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm">Đăng xuất</a>
  </div>
</nav>

<div class="container mt-4">
  <h4 class="fw-bold mb-1">Trang chủ Khách hàng</h4>
  <p class="text-muted">Chào mừng bạn đến với hệ thống đặt lịch gara trực tuyến</p>
  <hr>

  <div class="row g-4 mt-2">
    <div class="col-md-5">
      <div class="card shadow-sm h-100 border-0">
        <div class="card-body text-center p-4">
          <div style="font-size:3rem">📅</div>
          <h5 class="card-title fw-bold mt-2">Đặt lịch hẹn trực tuyến</h5>
          <p class="card-text text-muted">Xem khung giờ trống và đăng ký lịch hẹn chăm sóc, bảo dưỡng xe của bạn.</p>
          <a href="${pageContext.request.contextPath}/addAppointment" class="btn btn-dark px-4">Đặt lịch hẹn ngay</a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
