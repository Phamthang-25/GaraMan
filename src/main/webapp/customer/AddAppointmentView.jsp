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
  <title>GaraMan — Chọn khung giờ</title>
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
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/customer/CustomerView.jsp">Trang chủ</a></li>
      <li class="breadcrumb-item active">Chọn khung giờ</li>
    </ol>
  </nav>

  <div class="d-flex justify-content-between align-items-center mb-3">
    <h4 class="fw-bold mb-0">📅 Danh sách khung giờ trống</h4>
    <a href="${pageContext.request.contextPath}/customer/CustomerView.jsp" class="btn btn-outline-secondary btn-sm">← Quay lại</a>
  </div>

  <c:choose>
    <c:when test="${empty freeSlots}">
      <div class="alert alert-warning">Hiện tại không còn khung giờ trống. Vui lòng quay lại sau!</div>
    </c:when>
    <c:otherwise>
      <div class="card shadow-sm border-0">
        <div class="card-body p-0">
          <table class="table table-striped table-hover mb-0 align-middle">
            <thead class="table-dark">
              <tr>
                <th class="text-center" style="width: 60px;">STT</th>
                <th>Ngày</th>
                <th>Giờ bắt đầu</th>
                <th>Giờ kết thúc</th>
                <th>Trạng thái</th>
                <th class="text-center" style="width: 120px;">Hành động</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="slot" items="${freeSlots}" varStatus="i">
                <tr>
                  <td class="text-center">${i.index + 1}</td>
                  <td class="fw-bold"><fmt:formatDate value="${slot.date}" pattern="dd/MM/yyyy"/></td>
                  <td>${slot.start}</td>
                  <td>${slot.end}</td>
                  <td><span class="badge bg-success">${slot.status}</span></td>
                  <td class="text-center">
                    <a href="${pageContext.request.contextPath}/appointmentInfo?scheduleTimeId=${slot.id}"
                       class="btn btn-sm btn-dark px-3">Chọn</a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </c:otherwise>
  </c:choose>
</div>
</body>
</html>
