<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>GaraMan — Đăng nhập</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5" style="max-width:420px">
  <div class="card shadow-sm border-0">
    <div class="card-header bg-dark text-white text-center py-3">
      <h3 class="mb-0">🔧 GaraMan</h3>
      <small class="text-white-50">Hệ thống Quản lý Gara Ô tô</small>
    </div>
    <div class="card-body p-4">
      <c:if test="${not empty error}">
        <div class="alert alert-danger py-2">${error}</div>
      </c:if>
      <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="mb-3">
          <label class="form-label fw-bold">Tài khoản</label>
          <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập" required>
        </div>
        <div class="mb-3">
          <label class="form-label fw-bold">Mật khẩu</label>
          <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required>
        </div>
        <button type="submit" class="btn btn-dark w-100 py-2">Đăng nhập</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>
