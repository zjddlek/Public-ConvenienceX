package com.cx.www.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.EmpDAO;

public class FindPWCommand implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		String pw = req.getParameter("newPW");
		
		//System.out.println("id: "+id);
		//System.out.println("pw: "+pw);
		
		EmpDAO dao= new EmpDAO();
		
		dao.changePW(id, pw);
		
		dao.close();	
		
		return "login/login.jsp";
	}

}
