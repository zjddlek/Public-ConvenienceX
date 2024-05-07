package com.cx.www.emp;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.EmpVO;

public class ModifyAction implements Action{

	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		String b = req.getParameter("empno");

		if (b != null) {

			EmpDAO dao = new EmpDAO();
			EmpVO empvo = dao.getOneByEmpno(b);

			req.setAttribute("empvo", empvo);

			dao.close();

		}
		return "emp/modifyForm.jsp";
	}

}
