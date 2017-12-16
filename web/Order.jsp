<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICE_DOG
  Date: 2017/12/3
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@include file="showMenu.jsp" %>--%>
<html>
<head>
    <title>ご注文</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
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
    <script src="js/Order.js"></script>
</head>
<body>
<div class="label">标题</div>
<div class="main">
    <div class="left">
        <c:if test="${!empty requestScope.foodTypes}">
            <c:forEach items="${requestScope.foodTypes}" varStatus="status"
                       var="foodtype">
                <div class="meun"
                     onclick="showFoods(${foodtype.id})">${foodtype.name}</div>
            </c:forEach>
        </c:if>
    </div>
    <div class="right">
    </div>
</div>
<div id="car" onclick="showGoodsCar(this)"><span>购物车</span></div>
</body>
</html>
