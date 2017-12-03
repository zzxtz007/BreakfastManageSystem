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

    </style>
    <script src="js/jquery3.1.js"></script>
    <script>
        var nums;
        function changeNum(type) {
            num = 0;
            nums =type.parentNode.parentNode.childNodes[3];
            switch (type.innerText) {
                case '-':
                    num = -1;
                    break;
                case '+':
                    num = 1;
                    break;
            }
            nums.innerText = parseInt(nums.innerText)+num;
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
                var tr = document.createElement("tr");

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
                tr.appendChild(td);
                td.id=json.id;

                td = document.createElement("td");
                var btn = document.createElement("div");
                btn.innerHTML = "+";
                td.appendChild(btn);
                tr.appendChild(td);
                btn.addEventListener('click',function () {
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

</body>
</html>
