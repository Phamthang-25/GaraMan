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
  <title>GaraMan — Chi tiết sử dụng</title>
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
      <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/revenueStat?type=${type}&startDate=${startDate}&endDate=${endDate}">Thống kê</a></li>
      <li class="breadcrumb-item active">Chi tiết sử dụng</li>
    </ol>
  </nav>

  <div class="d-flex justify-content-between align-items-center mb-3">
    <div>
      <h4 class="fw-bold mb-1">🔍 Chi tiết lần sử dụng: <span class="text-primary">${itemName}</span></h4>
      <p class="text-muted mb-0">Thời gian từ <strong>${startDate}</strong> đến <strong>${endDate}</strong></p>
    </div>
    <a href="${pageContext.request.contextPath}/revenueStat?type=${type}&startDate=${startDate}&endDate=${endDate}"
       class="btn btn-outline-secondary btn-sm">← Quay lại danh sách</a>
  </div>

  <c:choose>
    <c:when test="${empty detailList}">
      <div class="alert alert-info">Không có lần sử dụng nào trong thời gian này.</div>
    </c:when>
    <c:otherwise>
      <div class="card shadow-sm border-0">
        <div class="card-body p-0">
          <table class="table table-striped table-hover mb-0 align-middle">
            <thead class="table-dark">
              <tr>
                <th class="text-center" style="width: 60px;">STT</th>
                <th>Thời gian sử dụng</th>
                <th>Mã hóa đơn</th>
                <th>Khách hàng</th>
                <th class="text-center">Số lượng</th>
                <th class="text-end">Thành tiền (VNĐ)</th>
                <th class="text-center" style="width: 140px;">Xem hóa đơn</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="d" items="${detailList}" varStatus="i">
                <tr>
                  <td class="text-center">${i.index + 1}</td>
                  <td><fmt:formatDate value="${d.createat}" pattern="dd/MM/yyyy HH:mm"/></td>
                  <td><span class="badge bg-secondary">#${d.invoiceid}</span></td>
                  <td>${d.customername}</td>
                  <td class="text-center">${d.soldcount}</td>
                  <td class="text-end fw-bold text-success">
                    <fmt:formatNumber value="${d.total}" type="number" groupingUsed="true"/>
                  </td>
                  <td class="text-center">
                    <a href="${pageContext.request.contextPath}/invoiceView?invoiceId=${d.invoiceid}"
                       class="btn btn-sm btn-dark">Xem hóa đơn</a>
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
