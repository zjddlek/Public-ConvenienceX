package com.cx.www.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.AttendanceDAO;
import com.cx.www.vo.AttendanceRecodVO;
import com.cx.www.vo.AttendanceVO;

public class AttendCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String empno = req.getParameter("empno");
		String sno = req.getParameter("sno");
		
		AttendanceDAO dao = new AttendanceDAO();
		AttendanceVO vo = dao.attGetOne(empno);
		ArrayList<AttendanceRecodVO> list = dao.getRecordAll(sno);
		
		dao.updateEnd(vo);
		
		dao.close();
		
		req.setAttribute("list", list);
		
		
		return "login/workMain.jsp";
	}

}
