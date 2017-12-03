<%@ page import="java.util.ArrayList" %>
<%@ page import="top.haha233.entity.FoodType" %>
<%@ page import="top.haha233.service.ServiceFactory" %>
<%@ page import="top.haha233.service.util.SuperInfo" %><%--
  Created by IntelliJ IDEA.
  User: ICE_DOG
  Date: 2017/12/3
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    ArrayList<FoodType> foodTypes;
    public void init(){
        SuperInfo foodTypeSi = ServiceFactory.getFoodTypeServiceImpl().showAllFoodType();
        if (foodTypeSi.getRet()==0){
            if (foodTypeSi.getListSize()>=0){
                foodTypes = foodTypeSi.getLists();
                if (foodTypes!=null){
                    System.out.println("成功");
                    System.out.println(foodTypes);
                }else {
                    System.out.println("1");
                }
            }else {
                System.out.println("2");
                System.out.println(foodTypeSi.getLists());
            }
        }else {
            System.out.println("3");
        }
    }
%>