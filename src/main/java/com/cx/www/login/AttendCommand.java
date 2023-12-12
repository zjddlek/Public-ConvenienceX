package com.cx.www.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.AttendanceDAO;
import com.cx.www.dao.ProfitDAO;
import com.cx.www.vo.AttendanceRecodVO;
import com.cx.www.vo.AttendanceVO;
import com.cx.www.vo.ProfitVO;
import com.cx.www.action.Action;

public class AttendCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String empno = req.getParameter("empno");
		String sno = req.getParameter("sno");
		int allDifference = Integer.parseInt(req.getParameter("allDifference"));
		int allSales = Integer.parseInt(req.getParameter("allSales"));
		int tap = Integer.parseInt(req.getParameter("tab"));
			
		AttendanceDAO dao = new AttendanceDAO();
		AttendanceVO vo = dao.attGetOne(empno);
		ArrayList<AttendanceRecodVO> list = dao.getRecordAll(sno);
		dao.updateEnd(vo);
		
		ProfitDAO pdao = new ProfitDAO();
		ProfitVO pvo = new ProfitVO();
		pvo.setATTNO(vo.getAttno());
		pvo.setCALCULATE(tap);
		pvo.setSALESAMOUNT(allSales);
		pvo.setDIFFERENCE(allDifference);
		
		pdao.addProfit(pvo);
		dao.close();
		pdao.close();

		req.setAttribute("list", list);
		
		
		return "login/attendanceLoginOk.jsp";
	}

}
