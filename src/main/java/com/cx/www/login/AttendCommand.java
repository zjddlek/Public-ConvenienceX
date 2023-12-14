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
		
		
		int tap = Integer.parseInt(req.getParameter("tab"));
		
		AttendanceDAO dao = new AttendanceDAO();
		AttendanceVO vo = dao.attGetOne(empno);
			
		ProfitDAO pdao = new ProfitDAO();
		ProfitVO pvo = new ProfitVO();
		
		if(tap==1) {
			int allDifference = Integer.parseInt(req.getParameter("allDifference"));
			int allSales = Integer.parseInt(req.getParameter("allSales"));
			pvo.setATTNO(vo.getAttno());
			pvo.setCALCULATE(tap);
			pvo.setSALESAMOUNT(allSales);
			pvo.setDIFFERENCE(allDifference);
		
		ArrayList<AttendanceRecodVO> list = dao.getRecordAll(sno);
		dao.updateEnd(vo);
		
		
		pdao.addProfit(pvo);
		dao.close();
		pdao.close();

		req.setAttribute("list", list);
		return "login/attendanceLoginOk.jsp";
		}else {
			int allEndDifference = Integer.parseInt(req.getParameter("allEndDifference"));
			int allEndSales = Integer.parseInt(req.getParameter("allEndSales"));
			pvo.setATTNO(vo.getAttno());
			pvo.setCALCULATE(tap);
			pvo.setSALESAMOUNT(allEndSales);
			pvo.setDIFFERENCE(allEndDifference);
			
			ArrayList<AttendanceRecodVO> list = dao.getRecordAll(sno);
					
			pdao.addProfit(pvo);
			dao.close();
			pdao.close();

			req.setAttribute("list", list);
			return "login/attendanceLoginOk.jsp";
			
		}
		
	}

}
