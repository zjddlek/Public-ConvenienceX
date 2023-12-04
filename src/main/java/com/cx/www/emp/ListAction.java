package com.cx.www.emp;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.EmpVO;

import cxcom.cx.www.action.Action;


public class ListAction implements Action{

	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		String name = req.getParameter("name");

		EmpDAO dao = new EmpDAO();
		
		if (name == null ) {
			
			ArrayList<EmpVO> list= dao.getAll();

			req.setAttribute("list",list);
			
			
		}
		else if(name != null) {
			EmpVO vo = dao.getOne(name);
			
			System.out.println("ename : " +vo.getEname());
			req.setAttribute("vo", vo);
		
			
			
		}
		
		dao.close();
		
		return "emp/test.jsp";
	}

}