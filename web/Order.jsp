<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICE_DOG
  Date: 2017/12/3
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="showMenu.jsp" %>
<html>
<head>
    <title>ご注文</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0px;
            box-sizing: border-box;
        }

        .label {
            width: 100%;
            height: 100px;
            background-color: bisque;

        }

        .main {
            width: 100%;
            display: flex;

        }

        .left {
            width: 30%;

        }

        .meun {
            width: 100%;
            line-height: 30px;
            color: black;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
        }

        .right {
            width: 70%;
        }

        #car {
            width: 20px;
            height: 80px;
            position: fixed;
            right: 0px;
            top: 50px;
            background-color: springgreen;
            cursor: pointer;
        }

        #open {
            width: 200px;
            height: 500px;
            position: fixed;
            right: 0px;
            top: 50px;
            background-color: springgreen;
            cursor: pointer;
        }
    </style>
    <script src="js/jquery3.1.js"></script>
    <script>
        var goodsCar = [];
        var isOpen = false;
        var interval;
        function updateGoodsCar(goods) {
            for (var g of goodsCar) {
                if (g.id === goods.id) {
                    g.num = goods.num;
                    return;
                }
            }
            goodsCar.push(goods);
        }

        function changeNum(type) {
            var id = type.parentNode.parentNode.id;
            var typeid = type.parentNode.parentNode.parentNode.id;
            var name = type.parentNode.parentNode.childNodes[0].innerText;
            var price = type.parentNode.parentNode.childNodes[1].innerText;
            var num = 0;
            var nums = type.parentNode.parentNode.childNodes[3];
            switch (type.innerText) {
                case '-':
                    if (parseInt(nums.innerText) === 0) {
                        num = 0;
                        break;
                    } else {
                        num = -1;
                    }
                    break;
                case '+':
                    num = 1;
                    break;
            }
            nums.innerText = parseInt(nums.innerText) + num;
            var goods = {
                "id": id,
                "food":
                    {
                        "id": id,
                        "name": name,
                        "price": price,
                        "foodtype":
                            {
                                "id": typeid,
                                "name": name,
                                "isdelete": 1
                            },
                        "isdelete": 1
                    },
                "num": nums.innerText
            };
            updateGoodsCar(goods);
        }

        function drawTable(data) {
            var right = document.querySelector(".right");
            var table = document.createElement("table");
            var oldtable = document.querySelector("table")
            if (oldtable != null) {
                oldtable.remove();
            }
            right.appendChild(table);
            for (var json of data) {
                table.id = json.foodType.id;
                var tr = document.createElement("tr");
                tr.id = json.id;
                var td = document.createElement("td");
                td.innerHTML = json.name;
                tr.appendChild(td);

                td = document.createElement("td");
                td.innerHTML = json.price;
                tr.appendChild(td);

                td = document.createElement("td");
                var btn = document.createElement("div");
                btn.innerHTML = "-";
                td.appendChild(btn);
                tr.appendChild(td);
                btn.addEventListener('click', function () {
                    changeNum(this);
                });


                td = document.createElement("td");
                td.innerHTML = 0;
                for (var g of goodsCar) {
                    if (g.id === tr.id) {
                        td.innerHTML = g.num;
                    }
                }
                tr.appendChild(td);
                td.id = json.id;

                td = document.createElement("td");
                var btn = document.createElement("div");
                btn.innerHTML = "+";
                td.appendChild(btn);
                tr.appendChild(td);
                btn.addEventListener('click', function () {
                    changeNum(this)
                });

                table.appendChild(tr);
            }
        }

        function showFoods(id) {
            $.ajax({
                "url": "ShowFoods",
                "type": 'post',
                "data": {id: id},
                "dataType": "json",
            })
                .done(function (data) {
                    drawTable(data);
                })
        }

        function updateGoodsCarList(Car) {
            var div = document.createElement("div")
            var table = document.createElement("table");
            var olddiv = document.querySelector("#carTable");
            if (olddiv != null) {
                olddiv.remove();
            }
            Car.appendChild(div);
            div.appendChild(table)
            div.id = "carTable";
            for (var i = 1; i <= goodsCar.length; i++) {
                var tr = document.createElement("tr");
                var td = document.createElement("td");
                td.innerHTML = i;
                table.appendChild(tr);
                tr.appendChild(td);

                td = document.createElement("td");
                td.innerHTML = goodsCar[i - 1].food.name;
                tr.appendChild(td);

                td = document.createElement("td");
                td.innerHTML = goodsCar[i - 1].food.price;
                tr.appendChild(td);

                td = document.createElement("td");
                td.innerHTML = goodsCar[i - 1].num;
                tr.appendChild(td);
            }
        }

        function showGoodsCar(Car) {
            var name = Car.id;
            isOpen = !isOpen;
            if (isOpen) {
                name = "open";
                Car.childNodes[0].textContent = "";
                interval = setInterval(function () {
                    updateGoodsCarList(Car);
                }, 200);
            } else {
                name = "car";
                Car.childNodes[0].textContent = "购物车";
                var olddiv = document.querySelector("#carTable");
                if (olddiv != null) {
                    clearInterval(interval);
                    olddiv.remove();
                }
            }
            Car.id = name;

        }
    </script>
</head>
<body>
<div class="label">标题</div>
<div class="main">
    <div class="left">
        <%
            init();
            for (FoodType f : foodTypes) {
        %>
        <div class="meun" onclick="showFoods(<%=f.getId()%>)"><%=f.getName()%>
        </div>
        <%
            }
        %>
    </div>
    <div class="right">

    </div>
</div>

<div id="car" onclick="showGoodsCar(this)"><span>购物车</span></div>
</body>
</html>
