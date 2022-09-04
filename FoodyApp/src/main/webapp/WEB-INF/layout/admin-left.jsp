<%-- 
    Document   : admin-left
    Created on : 13 thg 8, 2022, 11:24:31
    Author     : tran van phuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar bg-light">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
          <a class="nav-link" href="<c:url value="/admin/category-stats"/>">Thống kê doanh thu theo sản phẩm</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/store-stats"/>">Thống kê doanh thu theo cửa hàng</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/store-month-stats"/>">Thống kê doanh thu theo tháng</a>
      </li>
      
    </ul>
  </div>
</nav>
