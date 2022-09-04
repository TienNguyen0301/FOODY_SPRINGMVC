<%-- 
    Document   : foody
    Created on : 25 thg 7, 2022, 18:59:20
    Author     : tran van phuong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<br><br>
<div class="row" style="margin-top: 50px">
    <div class="col-md-6">
        <image style="width: 50%; margin-left: 100px; border-radius: 10%;" class="card-img-top img-fluid" src="${store.image}"/>
    </div>
    <div class="col-md-6">
        <h1 class="text-success">${store.name}</h1>
        <h3>Địa chỉ:  ${store.address}</h3>

    </div>
</div>
<br>


<br>

<br>

<c:forEach items="${store.foodCollection}" var="food">
    <div class="row">
        <div class="col-md-4">           
            <image style="width: 30%; margin-left: 64px" class=" border-img" src="${food.image}"/>            
        </div>
        <div class="col-md-3">
            <h1>${food.name}</h1>
        </div>
        <div class="col-md-3">
            <h3 style="margin-top: 20px">${food.price} VND</h3>
        </div>
        <div class="col-md-2" style="margin-top: 20px">
            <a href="#" style="width: 50px" class="btn btn-danger" onclick="addToCart(${food.id}, '${food.name}', ${food.price})" />+</a>
        </div>
    </div>
    <br><!-- comment -->
</c:forEach>
<br><br>

<c:url value="/stores/{storeId}" var="action"/>



<form:form>
    <div class="rating-group">
        <div class="star-item">
            <i class="fa fa-star-o" id="star1" style="font-size:24px"></i>
            <input type="radio" id="valueId1" name="sao"
                       placeholder="Số sao" value="1" class="item-input" onclick="active1()" style="font-size:24px" />
        </div>

        <div class="star-item">
             <i class="fa fa-star-o" id="star2" style="font-size:24px"></i>
            <input type="radio" id="valueId2" name="sao"
                       placeholder="Số sao" value="2" class="item-input" onclick="active2()" style="font-size:24px" />
        </div>

        <div class="star-item">
             <i class="fa fa-star-o" id="star3" style="font-size:24px"></i>
            <input type="radio" id="valueId3" name="sao"
                       placeholder="Số sao" value="3" class="item-input" onclick="active3()" style="font-size:24px" />
        </div>

        <div class="star-item">
              <i class="fa fa-star-o" id="star4" style="font-size:24px"></i>
            <input type="radio" id="valueId4" name="sao"
                       placeholder="Số sao" value="4" class="item-input" onclick="active4()" style="font-size:24px" />
        </div>

        <div class="star-item">
             <i class="fa fa-star-o" id="star5" style="font-size:24px"></i>
            <input type="radio" id="valueId5" name="sao"
                       placeholder="Số sao" value="5" class="item-input" onclick="active5()" style="font-size:24px" />
        </div>
    </div>
    
<!--    <i class="fa fa-star-o" style="font-size:24px"></i>-->
    
    <div class="form-group">
        <textarea class="form-control" id="commentId" placeholder="Nhập đánh giá .."></textarea>
        <br>
        <input type="button" onclick="addComment(${store.id})"
               value="Đánh giá" class="btn btn-danger" />
    </div>     
  
</form:form>


<c:forEach var="c" items="${rating}">
    <li class="nav-item me-2">

        <h1>c.id</h1>
    </li>
</c:forEach>

<br>
<div id="commentArea">

    <c:forEach items="${commentStore}" var="commentStore">
        <div clas="row">
            <div class="commentDate">
                <p>${commentStore.content}</p>
                <i>${commentStore.createdDate}</i>
                <hr>
            </div>

        </div>
    </c:forEach>

    <nav style="margin-top:20px" aria-label="Page navigation example">
        <ul class="pagination">
            <c:forEach begin="1" end="${Math.ceil(commentCounter/2)}" var="i">
                <c:url value="/stores/${store.id}" var="path">
                    <c:param name="page" value="${i}"></c:param>               
                </c:url>
                <li class="page-item"><a class="page-link" href="${path}">${i}</a></li>
                </c:forEach>


        </ul>
    </nav>


    <script >
        window.onload = function () {
            let dates = document.querySelectorAll(".commentDate > i");
            for (let i = 0; i < dates.length; i++)
                dates[i].innerText = moment(dates[i].innerText).format("MMM do YY"));
  
        };
        

    </script>

   


