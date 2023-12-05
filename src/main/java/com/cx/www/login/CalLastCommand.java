package com.cx.www.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.CalDAO;
import com.cx.www.dao.ShopDAO;
import com.cx.www.vo.CalVO;
import com.cx.www.vo.ShopVO;

import cxcom.cx.www.action.Action;

public class CalLastCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String empno = req.getParameter("empno");
		String sno = req.getParameter("sno");
		ShopDAO sdao = new ShopDAO();
		ShopVO svo = sdao.getOne(sno);
		req.setAttribute("svo", svo);
		sdao.close();
		
		CalDAO dao = new CalDAO();
		ArrayList<CalVO> list = dao.getCashCal(empno);
		ArrayList<CalVO> list2 = dao.getGiftCal(empno);
		dao.close();
		req.setAttribute("list", list);
		req.setAttribute("list2", list2);
		//System.out.println("list : " + list);
		
		
		return "login/calLast.jsp";
	}

}
