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
  <title>GaraMan — Trang quản lý</title>
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

<div class="container mt-4">
  <h4 class="fw-bold mb-1">Bảng điều khiển quản lý</h4>
  <p class="text-muted">Quản lý và thống kê hoạt động kinh doanh của gara</p>
  <hr>

  <div class="row g-4 mt-2">
    <div class="col-md-5">
      <div class="card shadow-sm h-100 border-0">
        <div class="card-body text-center p-4">
          <div style="font-size:3rem">📊</div>
          <h5 class="card-title fw-bold mt-2">Thống kê dịch vụ / phụ tùng</h5>
          <p class="card-text text-muted">Xem báo cáo doanh thu từ dịch vụ và phụ tùng theo khoảng thời gian tùy chọn.</p>
          <a href="${pageContext.request.contextPath}/revenueStat" class="btn btn-dark px-4">Xem thống kê</a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
