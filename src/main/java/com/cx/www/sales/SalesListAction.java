package com.cx.www.sales;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.SalesDAO;
import com.cx.www.vo.SalesVO;

public class SalesListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String salesno = req.getParameter("s_no");
		String salesdate = req.getParameter("s_date");
		
		SalesDAO dao = new SalesDAO();
		
		ArrayList<SalesVO> list = dao.getSalesList(salesno, salesdate);
		
		dao.close();
		
		req.setAttribute("s_list", list);
		
		return "sales/sales.jsp";
	}

}
