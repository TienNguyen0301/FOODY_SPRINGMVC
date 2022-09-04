/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



function checkRating() {
    let sao_1 = document.getElementById("valueId1");
    let sao_2 = document.getElementById("valueId2");
    let sao_3 = document.getElementById("valueId3");
    let sao_4 = document.getElementById("valueId4");
    let sao_5 = document.getElementById("valueId5");


    if (sao_1.checked) {
        return 1;
    } else if (sao_2.checked) {
        return 2;
    } else if (sao_3.checked) {
        return 3;
    } else if (sao_4.checked) {
        return 4;
    } else if (sao_5.checked) {
        return 5;
    }
}


function addComment(storeId) {
    fetch("/SaleApp/api/add-comment", {
        method: 'post',
        body: JSON.stringify({
            "content": document.getElementById("commentId").value,
            "storeId": storeId,
            "value": checkRating()

        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {

        console.info(res)
        return res.json();

    }).then(function (data) {

        console.info(data);

        let area = document.getElementById("commentArea");

        area.innerHTML = `
            <div clas="row">
                <div class="commentDate">
                    <p>${data.content}</p>
                    <i>${moment(data.createdDate).format("MMM do YY")}</i>
                    <hr>
                </div>

            </div>
        ` + area.innerHTML

        location.reload()
    })

}

function addToCart(id, name, price) {

    event.preventDefault()

    fetch("/SaleApp/api/cart", {
        method: 'post',
        body: JSON.stringify({
            "foodId": id,
            "foodName": name,
            "price": price,
            "quantity": 1
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json()
    }).then(function (data) {
        let counter = document.getElementById("cartCounter")
        counter.innerText = data
    })


}

function updateCart(obj, foodId) {
    fetch("/SaleApp/api/cart", {
        method: 'put',
        body: JSON.stringify({
            "foodId": foodId,
            "foodName": "",
            "price": 0,
            "quantity": obj.value
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json()
    }).then(function (data) {
        let counter = document.getElementById("cartCounter")
        counter.innerText = data.counter

        let amount = document.getElementById("amountCart")
        amount.innerText = data.amount
    })
}

function deleteCart(foodId) {
    if (confirm("Bạn có chắc chắn xóa không?") == true) {
        fetch(`/SaleApp/api/cart/${foodId}`, {
            method: 'delete'
        }).then(function (res) {
            return res.json()
        }).then(function (data) {
            let counter = document.getElementById("cartCounter")
            counter.innerText = data.counter

            let amount = document.getElementById("amountCart")
            amount.innerText = data.amount
            location.reload()
        })
    }

}


function pay() {
    if (confirm("Bạn chắc chắn thanh toán?") == true) {
        fetch("/SaleApp/api/pay", {
            method: 'post'
        }).then(function (res) {
            return res.json();
        }).then(function (code) {
            console.info(code);
            location.reload();
        })


    }
}



function load() {
    let sao1 = document.getElementById('star1');
    let sao2 = document.getElementById('star2');
    let sao3 = document.getElementById('star3');
    let sao4 = document.getElementById('star4');
    let sao5 = document.getElementById('star5');

    let st1 = document.getElementById('valueId1');
    let st2 = document.getElementById('valueId2');
    let st3 = document.getElementById('valueId3');
    let st4 = document.getElementById('valueId4');
    let st5 = document.getElementById('valueId5');

    var a = document.getElementsByName('sao');
    var ischecked_method = false;

    for (var i = 0; i < a.length; i++) {
        if (a[i].checked) {
            ischecked_method = true;
            break;
        }
    }
}
load();



function active1() {
    let sao1 = document.getElementById('star1');

    star1.style.color = 'red';
}

function active2() {
    let sao1 = document.getElementById('star1');
    let sao2 = document.getElementById('star2');

    star1.style.color = 'red';
    star2.style.color = 'red';
}

function active3() {
    let sao1 = document.getElementById('star1');
    let sao2 = document.getElementById('star2');
    let sao3 = document.getElementById('star3');

    star1.style.color = 'red';
    star2.style.color = 'red';
    star3.style.color = 'red';
}

function active4() {
    let sao1 = document.getElementById('star1');
    let sao2 = document.getElementById('star2');
    let sao3 = document.getElementById('star3');
    let sao4 = document.getElementById('star4');

    star1.style.color = 'red';
    star2.style.color = 'red';
    star3.style.color = 'red';
    star4.style.color = 'red';
}

function active5() {
    let sao1 = document.getElementById('star1');
    let sao2 = document.getElementById('star2');
    let sao3 = document.getElementById('star3');
    let sao4 = document.getElementById('star4');
    let sao5 = document.getElementById('star5');

    star1.style.color = 'red';
    star2.style.color = 'red';
    star3.style.color = 'red';
    star4.style.color = 'red';
    star5.style.color = 'red';
}



