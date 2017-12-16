package top.haha233.servlet;

import top.haha233.entity.FoodType;
import top.haha233.service.ServiceFactory;
import top.haha233.service.util.SuperInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ShowFoodTypeServlet", urlPatterns = {"/ShowFoodType"})
public class ShowFoodTypeServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		SuperInfo foodTypeSi = ServiceFactory.getFoodTypeServiceImpl().showAllFoodType();
		ArrayList<FoodType> foodTypes;
		if (foodTypeSi.getRet() == 0) {
			if (foodTypeSi.getListSize() >= 0) {
				foodTypes = foodTypeSi.getLists();
				if (foodTypes != null) {
					System.out.println("成功");
					System.out.println(foodTypes);
					request.setAttribute("foodTypes", foodTypes);
					request.getRequestDispatcher("Order.jsp").forward(request, response);
				} else {
					System.out.println("foodTypes为空");
					response.getWriter().print("<script >alert('错误！')</script>");
					response.sendRedirect("Menu_staff.jsp");
				}
			} else {
				System.out.println(foodTypeSi.getLists());
				response.getWriter().print("<script >alert('错误！')</script>");
				response.sendRedirect("Menu_staff.jsp");
			}
		} else {
			System.out.println("3");
			response.getWriter().print("<script >alert('错误！')</script>");
			response.sendRedirect("Menu_staff.jsp");
		}
	}
}
