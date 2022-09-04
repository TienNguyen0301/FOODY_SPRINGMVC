<%-- 
    Document   : cart
    Created on : 12 thg 8, 2022, 19:50:02
    Author     : tran van phuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1 style="margin-top: 100px" class="text-center text-danger">GIỎ HÀNG</h1>

<c:if test="${carts == null}">
    <h4 class="text-center text-danger">Không có sản phẩm</h4>
</c:if>
    
<c:if test="${carts != null}">
    <table class="table">
        <tr>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Đơn giá</th>
            <th>Số lượng</th>
            <th></th>
        </tr>
        <c:forEach items="${carts}" var="c">
        <tr>
            <td>${c.foodId}</td>
            <td>${c.foodName}</td>
            <td>${c.price} VND</td>
            <td>
                <div class="form-group">
                    <input type="number"
                           onblur="updateCart(this,${c.foodId})"
                           value="${c.quantity}" 
                           class="form-control" />
                </div>
            </td>
            <td>
                <input type="button"
                       value="Xóa" 
                       onclick="deleteCart(${c.foodId})"
                       class="btn btn-danger"/>
            </td>
        </tr>
        </c:forEach>
    </table>
    <div>
        <h4 class="text-info">Tổng tiền    <span id="amountCart">${cartStats.amount}</span> VND</h4>
    </div>
        <input onclick="pay()" type="button" value="THANH TOÁN" class="btn btn-danger"/>
</c:if>