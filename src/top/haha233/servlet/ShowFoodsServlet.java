package top.haha233.servlet;

import com.google.gson.Gson;
import top.haha233.service.ServiceFactory;
import top.haha233.service.util.SuperInfo;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/**
 * @author ICE_DOG
 */
@WebServlet(name = "ShowFoodsServlet",urlPatterns = "/ShowFoods")
public class ShowFoodsServlet extends javax.servlet.http.HttpServlet {
	protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		String id = request.getParameter("id");
		System.out.println("fuck id"+id);
		SuperInfo siFoods = ServiceFactory.getFoodServiceImpl().getFoodsByFoodTypeId(id);
		if (siFoods.getRet()==0) {
			if (siFoods.getListSize() >= 0) {
				Gson g = new Gson();
				String jsonStr = g.toJson(siFoods.getLists());
				response.getWriter().print(jsonStr);
				System.out.println(siFoods.getLists());
			}
		}
	}

	protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
		doPost(request,response);
	}
}
