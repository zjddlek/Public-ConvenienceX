package com.cx.www.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.EmpVO;

public class ModifyAction implements Action{

	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		String b = req.getParameter("empno");
		
		System.out.println("empno: "+b);

		if (b != null) {

			EmpDAO dao = new EmpDAO();
			EmpVO vo = dao.getOneByEmpno(b);
			

			req.setAttribute("vo", vo);
			
			System.out.println(vo);
			
			System.out.println("ModifyAction 실행중");

			dao.close();

		}
		return "emp/modifyForm.jsp";
	}

}
