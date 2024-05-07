package com.cx.www.sales;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;

public class SalesAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String sno = req.getParameter("sno");
		req.setAttribute("sno", sno);
		
		return "sales/sales.jsp";
	}

}
