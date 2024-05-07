package com.cx.www.emp;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.EmpDAO;

public class DeleteAction implements Action {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		String b = req.getParameter("empno");
		
		EmpDAO dao = new EmpDAO();
		dao.deleteOne(b);
		
		dao.close();
		
		
		
		return "mc?type=emp";
	}

}
