package top.haha233.servlet;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeMap;

@WebServlet(name = "InsertCheckListServlet", urlPatterns = {"/InsertCheckList"})
public class InsertCheckListServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String json = request.getParameter("car");
		System.out.println("json");
		System.out.println(json);
		response.getWriter().print("fuc");
		Gson g = new Gson();
		ArrayList a = g.fromJson(json, ArrayList.class);
		System.out.println(a);
	}
}
