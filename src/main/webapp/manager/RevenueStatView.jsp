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
  <title>GaraMan — Thống kê doanh thu</title>
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
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/manager/ManagerView.jsp">Trang chủ</a></li>
      <li class="breadcrumb-item active">Thống kê doanh thu</li>
    </ol>
  </nav>

  <h4 class="fw-bold mb-3">📊 Thống kê dịch vụ / phụ tùng theo doanh thu</h4>

  <!-- Form lọc -->
  <div class="card shadow-sm border-0 mb-4">
    <div class="card-body p-4">
      <form method="get" action="${pageContext.request.contextPath}/revenueStat" class="row g-3">
        <div class="col-md-3">
          <label class="form-label fw-bold">Loại thống kê</label>
          <select name="type" class="form-select" required>
            <option value="service" ${type == 'service' ? 'selected' : ''}>Dịch vụ</option>
            <option value="product" ${type == 'product' ? 'selected' : ''}>Phụ tùng</option>
          </select>
        </div>
        <div class="col-md-3">
          <label class="form-label fw-bold">Từ ngày</label>
          <input type="date" name="startDate" class="form-control" value="${not empty startDate ? startDate : '2026-11-01'}" required>
        </div>
        <div class="col-md-3">
          <label class="form-label fw-bold">Đến ngày</label>
          <input type="date" name="endDate" class="form-control" value="${not empty endDate ? endDate : '2026-11-30'}" required>
        </div>
        <div class="col-md-3 d-flex align-items-end">
          <button type="submit" class="btn btn-dark w-100 fw-bold">🔍 Tìm kiếm</button>
        </div>
      </form>
    </div>
  </div>

  <!-- Bảng kết quả -->
  <c:if test="${not empty statList}">
    <div class="card shadow-sm border-0">
      <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center py-3">
        <h6 class="mb-0 fw-bold">
          Danh sách ${type == 'service' ? 'Dịch vụ' : 'Phụ tùng'} (từ ${startDate} đến ${endDate})
        </h6>
      </div>
      <div class="card-body p-0">
        <table class="table table-striped table-hover mb-0 align-middle">
          <thead class="table-secondary">
            <tr>
              <th class="text-center" style="width: 60px;">STT</th>
              <th>Tên ${type == 'service' ? 'Dịch vụ' : 'Phụ tùng'}</th>
              <th class="text-center">Số lần sử dụng</th>
              <th class="text-end">Tổng doanh thu (VNĐ)</th>
              <th class="text-center" style="width: 140px;">Thao tác</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="stat" items="${statList}" varStatus="i">
              <tr>
                <td class="text-center">${i.index + 1}</td>
                <td class="fw-bold">
                  <c:choose>
                    <c:when test="${type == 'service'}">${stat.servicename}</c:when>
                    <c:otherwise>${stat.productname}</c:otherwise>
                  </c:choose>
                </td>
                <td class="text-center">${stat.soldcount}</td>
                <td class="text-end fw-bold text-primary">
                  <fmt:formatNumber value="${stat.total}" type="number" groupingUsed="true"/>
                </td>
                <td class="text-center">
                  <c:choose>
                    <c:when test="${type == 'service'}">
                      <a href="${pageContext.request.contextPath}/revenueDetailStat?type=service&itemId=${stat.serviceid}&itemName=${stat.servicename}&startDate=${startDate}&endDate=${endDate}"
                         class="btn btn-sm btn-outline-dark">Xem chi tiết</a>
                    </c:when>
                    <c:otherwise>
                      <a href="${pageContext.request.contextPath}/revenueDetailStat?type=product&itemId=${stat.productid}&itemName=${stat.productname}&startDate=${startDate}&endDate=${endDate}"
                         class="btn btn-sm btn-outline-dark">Xem chi tiết</a>
                    </c:otherwise>
                  </c:choose>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </c:if>

  <c:if test="${not empty type and empty statList}">
    <div class="alert alert-info">Không tìm thấy dữ liệu trong khoảng thời gian đã chọn.</div>
  </c:if>
</div>
</body>
</html>
