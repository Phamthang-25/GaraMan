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
  <title>GaraMan — Điền thông tin lịch hẹn</title>
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

<div class="container mt-4" style="max-width: 650px;">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/customer/CustomerView.jsp">Trang chủ</a></li>
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/addAppointment">Chọn giờ</a></li>
      <li class="breadcrumb-item active">Xác nhận lịch hẹn</li>
    </ol>
  </nav>

  <c:if test="${not empty message}">
    <c:choose>
      <c:when test="${message.contains('thành công')}">
        <div class="card shadow-sm border-0 border-top border-success border-4 p-4 text-center">
          <div style="font-size: 3rem;">🎉</div>
          <h4 class="text-success fw-bold mt-2">${message}</h4>
          <p class="text-muted">Cảm ơn bạn đã đặt lịch. Chúng tôi rất hân hạnh được phục vụ bạn.</p>
          <div class="mt-3">
            <a href="${pageContext.request.contextPath}/customer/CustomerView.jsp" class="btn btn-dark">Về trang chủ</a>
            <a href="${pageContext.request.contextPath}/addAppointment" class="btn btn-outline-secondary">Đặt lịch khác</a>
          </div>
        </div>
      </c:when>
      <c:otherwise>
        <div class="alert alert-danger">${message}</div>
      </c:otherwise>
    </c:choose>
  </c:if>

  <c:if test="${empty message}">
    <div class="card shadow-sm border-0">
      <div class="card-header bg-dark text-white py-3">
        <h5 class="mb-0 fw-bold">📋 Thông tin xác nhận lịch hẹn</h5>
      </div>
      <div class="card-body p-4">
        <!-- Khung giờ đã chọn -->
        <div class="alert alert-secondary mb-4">
          <div class="fw-bold mb-1">Khung giờ đã chọn:</div>
          <div>📅 Ngày: <strong><fmt:formatDate value="${selectedSlot.date}" pattern="dd/MM/yyyy"/></strong></div>
          <div>⏰ Thời gian: <strong>${selectedSlot.start} — ${selectedSlot.end}</strong></div>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/appointmentInfo">
          <input type="hidden" name="scheduleTimeId" value="${selectedSlot.id}">

          <div class="mb-3">
            <label class="form-label fw-bold">Họ và tên</label>
            <input type="text" class="form-control" value="${member.name}" readonly>
          </div>

          <div class="mb-3">
            <label class="form-label fw-bold">Email</label>
            <input type="text" class="form-control" value="${member.email}" readonly>
          </div>

          <div class="mb-3">
            <label class="form-label fw-bold">Số điện thoại liên hệ</label>
            <input type="text" name="phone" class="form-control" value="${member.phone}" required>
          </div>

          <div class="d-flex justify-content-between mt-4">
            <a href="${pageContext.request.contextPath}/addAppointment" class="btn btn-outline-secondary">← Chọn lại giờ</a>
            <button type="submit" class="btn btn-dark px-4 fw-bold">Xác nhận đặt lịch</button>
          </div>
        </form>
      </div>
    </div>
  </c:if>
</div>
</body>
</html>
