package com.cx.www.ajax;
 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.SetContextPropertiesRule;
import org.json.simple.JSONObject;

import com.cx.www.dao.EmpDAO;
@WebServlet("/idCheck")
public class idCheck extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset =UTF-8");
		
		String id = req.getParameter("id");
		
		EmpDAO dao = new EmpDAO();
		
		int count = dao.IdCount(id);
		
		
		JSONObject idid = new JSONObject();
		idid.put("count", count);
		
		
		
		 resp.setContentType("application/x-json; charset=utf-8");
		 resp.getWriter().print(idid);
		 
		
	}

}
