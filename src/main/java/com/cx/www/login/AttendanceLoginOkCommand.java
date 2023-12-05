package com.cx.www.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.AttendanceDAO;
import com.cx.www.dao.EmpDAO;
import com.cx.www.dao.ShopDAO;
import com.cx.www.vo.AttendanceRecodVO;
import com.cx.www.vo.AttendanceVO;
import com.cx.www.vo.EmpVO;
import com.cx.www.vo.ShopVO;

import cxcom.cx.www.action.Action;

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
		AttendanceVO avo2 = adao.attGetOne(empno);
		ArrayList<AttendanceRecodVO> list = adao.getRecordAll(sno);
		ShopDAO sdao = new ShopDAO();
		ShopVO svo = sdao.getOne(sno);
		req.setAttribute("svo", svo);
		sdao.close();

		if (vo.getId() == null || vo.getPwd() == null) {
			return "login/attendanceLogin.jsp";
		} else {
			if (avo2 != null) {
				AttendanceVO avo = new AttendanceVO();
				avo.setEmpno(empno);
				adao.addOne(avo);
				req.setAttribute("list", list);
				req.setAttribute("sno", sno);
				dao.close();
				adao.close();
				System.out.println("출근");
				return "login/workMain.jsp";
			} else {
				System.out.println("회원이아님");
				req.setAttribute("list", list);
				dao.close();
				adao.close();
				return "login/workMain.jsp";
			}
		}
	}

}
