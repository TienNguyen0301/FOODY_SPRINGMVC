<%-- 
    Document   : store
    Created on : 27 thg 7, 2022, 21:19:08
    Author     : tran van phuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-danger">ĐĂNG KÝ CỬA HÀNG</h1>


<c:url value="/store/registerStore" var="action"></c:url>
    
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">${errMsg}</div>
</c:if>
<form:form method="post" 
           action="${action}" 
           modelAttribute="store"
           enctype="multipart/form-data">
    <br>
    <form:errors path="*" cssClass="alert alert-danger" element="div"/>
    <div class="form-group">
        <label for="name">Tên cửa hàng</label>
        <form:input type="text" id="name" path="name" cssClass="form-control" />
        <form:errors path="name" cssClass="text-danger" element="div"/>
    </div>
    <div class="form-group">
        <label for="cate">Danh mục</label>
        <form:select id="cate" path="categoryId" cssClass="form-control">
            <c:forEach items="${categories}" var="cat">
                <option value="${cat.id}">${cat.name}</option>   
            </c:forEach>
        </form:select>
        <form:errors path="categoryId" cssClass="text-danger" element="div"/>
    </div>
    <div class="form-group">
        <label for="address">Địa chỉ</label>
        <form:input type="text" id="address" path="address" cssClass="form-control" />
    </div>
        
    <div class="form-group" >
        <label for="file">Ảnh cửa hàng</label>
        <form:input type="file" id="file" path="file" cssClass="form-control" />
    </div>
    <br>
    <div class="form-group" >
        <input type="submit" value="Tạo cửa hàng" class="btn btn-primary" />
    </div>
</form:form>