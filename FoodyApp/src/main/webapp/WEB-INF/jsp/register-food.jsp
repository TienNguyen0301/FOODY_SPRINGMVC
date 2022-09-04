<%-- 
    Document   : register-food
    Created on : 10 thg 8, 2022, 21:00:44
    Author     : tran van phuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<br>
<br>
<h1 class="text-center text-danger" style="margin-top: 50px">THÊM MÓN ĂN</h1>


<br><br>


<c:forEach items="${listStore}" var="storeUser">
    <div class="row">
        <div class="col-md-6">
            <image style="width: 50%; margin-left: 100px" class="card-img-top img-fluid" src="${storeUser.image}"/>
        </div>
        <div class="col-md-6">
            <h1>${storeUser.name}</h1>
            <h3>Địa chỉ: ${storeUser.address}</h3>

            <hr>
            <c:forEach items="${storeUser.foodCollection}" var="food">
                <div class="row">
                    <div class="col-md-3">           
                        <image style="width: 95%; border-radius: 10%" class="card-img-top img-fluid" src="${food.image}"/>            

                    </div>
                    <div class="col-md-5">
                        <h3 style="text-align: center; margin-top: 20px">${food.name}</h3> 
                    </div>

                    <div class="col-md-3">

                        <h3 style="margin-top: 20px">${food.price} VND</h3>
                    </div>

                </div>
                <hr>
            </c:forEach>
        </div>     

    </div>
    <br><!-- comment -->

    <div class="btn-add" style="background-color: lightblue">
        <a class="text-danger" href="<c:url value="/store/registerFood/${storeUser.id}" />">Thêm món ăn</a>
    </div>

    <br>
    <hr>

</c:forEach>




