<%-- 
    Document   : admin-header
    Created on : Sep 4, 2022, 8:59:01 AM
    Author     : Admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container-fluid fixed-top px-0 wow fadeIn background-header" data-wow-delay="0.1s">   
    <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
        <a href="<c:url value="/"/>" class="navbar-brand ms-4 ms-lg-0">
            <h1 class="fw-bold text-primary m-0">F<span class="text-secondary">oo</span>dy</h1>
        </a>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="<c:url value="/" />" class="nav-item nav-link active text-success">Home</a>

                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <a href="<c:url value="/login" />" class="nav-item nav-link text-success">Đăng Nhập</a> 
                    <a href="<c:url value="/register" />" class="nav-item nav-link text-success">Đăng Ký</a>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <c:set var="role" value="ROLE_ADMIN"/>
                    <c:if test="${currentUser.userRole.equals(role)}">
                        <a href="<c:url value="/admin/category-stats" />" class="nav-item nav-link text-success">Thống kê</a> 
                    </c:if>
                    <a href="<c:url value="/" />" class="nav-item nav-link text-success">
                        ${pageContext.request.userPrincipal.name}
                    </a>
                    <a class="nav-item nav-link btn-cart text-success"  href="<c:url value="/cart"/>" >
                        <i class="fas fa-cart-plus pd-5"></i>
                        <div class="bad badge-danger" id="cartCounter">${cartCounter}</div>
                    </a>
                    <a href="<c:url value="/logout" />" class="nav-item nav-link text-danger">
                        Logout
                    </a>
                </c:if>

            </div>
            <div class="d-none d-lg-flex ms-2">


<!--                <a class="btn-sm-square bg-white rounded-circle ms-3"  href="<c:url value="/cart"/>" >
    <i style=" font-size: 50px" class="fa fa-shopping-bag text-body"></i>
    <div style=" font-size: 50px" class="bad badge-danger" id="cartCounter">${cartCounter}</div>
</a>-->

               
            </div>
        </div>
    </nav>

</div>
