package com.cx.www.sales;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cx.www.dao.SalesDAO;
import com.cx.www.vo.SalesVO;
import cxcom.cx.www.action.Action;

public class SalesDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		/*
		 * String salesdate = req.getParameter("date");
		 * 
		 * SalesDAO dao = new SalesDAO();
		 * 
		 * ArrayList<SalesVO> vo = dao.getSalesList(salesdate);
		 * 
		 * dao.close();
		 * 
		 * req.setAttribute("detail", vo);
		 */
		
		return "sales/sales.jsp";
	}

}
