<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/1
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>薪火相传</title>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0;
            box-sizing: border-box;
        }
        .button{

            height: 100px;
            width: 300px;
            float: left;
            background-color: #baebbd;
            color: coral;
            text-align: center;
            line-height: 100px;
            margin: 2px;
        }
    </style>
    <script type="text/javascript">
        function order() {
            location.href="ShowFoodType";
        }
    </script>
</head>
<body>
<div >标题</div>
<div>
    <div class="button" onclick="order()">进入点餐</div>
    <div class="button"></div>
</div>
<div>
    <div class="button"></div>
    <div class="button">下班</div>
</div>
</body>
</html>
