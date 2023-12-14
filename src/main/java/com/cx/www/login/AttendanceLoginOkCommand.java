package com.cx.www.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.AttendanceDAO;
import com.cx.www.dao.EmpDAO;
import com.cx.www.vo.AttendanceRecodVO;
import com.cx.www.vo.AttendanceVO;
import com.cx.www.vo.EmpVO;

public class AttendanceLoginOkCommand implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String sno = req.getParameter("sno");

		EmpDAO dao = new EmpDAO();
		EmpVO vo = dao.getOneSM(id, pwd);
		String empno = vo.getEmpno();
		AttendanceDAO adao = new AttendanceDAO();
		ArrayList<AttendanceRecodVO> list = adao.getRecordAll(sno);

		if (vo.getId() == null || vo.getPwd() == null||vo == null) {
			req.setAttribute("sno", sno);
			dao.close();
			adao.close();
			return "login/attendanceLogin.jsp";
			
		} else{
				
				AttendanceVO avo = new AttendanceVO();
				avo.setEmpno(empno);
				adao.addOne(avo);
				req.setAttribute("list", list);
				dao.close();
				adao.close();
				return "login/attendanceLoginOk.jsp";
			}
		}
	}


