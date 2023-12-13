package com.cx.www.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.CalDAO;
import com.cx.www.vo.CalVO;

import com.cx.www.action.Action;

public class CalLastCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String empno = req.getParameter("empno");
		
		CalDAO dao = new CalDAO();
		ArrayList<CalVO> list = dao.getCardCal(empno);
		ArrayList<CalVO> list2 = dao.getCashCal(empno);
		ArrayList<CalVO> list3 = dao.getGiftCal(empno);
		
		ArrayList<CalVO> endCardCal = dao.getCardCalEnd();
		ArrayList<CalVO> endCashCal = dao.getCashCalEnd();
		ArrayList<CalVO> endGiftCal = dao.getGiftCalEnd();
		
		dao.close();
		req.setAttribute("list", list);
		req.setAttribute("list2", list2);
		req.setAttribute("list3", list3);
		
		req.setAttribute("endCardCal", endCardCal);
		req.setAttribute("endCashCal", endCashCal);
		req.setAttribute("endGiftCal", endGiftCal);
		//System.out.println("list : " + list);
		
		
		return "cal/calLast.jsp";
	}

}
