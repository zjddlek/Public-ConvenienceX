package com.cx.www.ajax;
 
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.json.simple.JSONObject;

import com.cx.www.dao.ShopDAO;
import com.cx.www.vo.ShopVO;

@WebServlet("/snamecheck")
public class SnameCheckServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset =UTF-8");

		String sname = req.getParameter("sname");
		
		ShopDAO dao = new ShopDAO();
		
		int count = dao.snameCount(sname);

		
		JSONObject jobj = new JSONObject();
		jobj.put("count", count);
		
		resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(jobj);
		
	}
}
