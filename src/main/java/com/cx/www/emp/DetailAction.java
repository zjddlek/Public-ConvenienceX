package com.cx.www.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cx.www.action.Action;
import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.EmpVO;

public class DetailAction implements Action {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		String empno = req.getParameter("empno");
		
		System.out.println("detailAction 실행중");
		
		if(empno!= null) {
			EmpDAO dao = new EmpDAO();
			EmpVO empvo = dao.getOneByEmpno(empno);
			
			req.setAttribute("empvo", empvo);
			
			System.out.println("ActionVO:"+empvo);
			
			dao.close();
			
			
		}
		
		return "emp/empDetail.jsp";
	}

}
