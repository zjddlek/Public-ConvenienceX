package com.cx.www.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.EmpVO;

import cxcom.cx.www.action.Action;

public class DetailAction implements Action {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		String empno = req.getParameter("empno");
		
		
		 System.out.println("empno:"+empno);
		 
		System.out.println("detailAction 실행중");
		
		if(empno!= null) {
			EmpDAO dao = new EmpDAO();
			EmpVO vo = dao.getOneByEmpno(empno);
			
			req.setAttribute("vo", vo);
			
			System.out.println("vo:"+vo);
			
			dao.close();
			
			HttpSession Session = req.getSession();
			Session.setAttribute("vo", vo);
			
			
		}
		
		return "emp/empDetail.jsp";
	}

}
