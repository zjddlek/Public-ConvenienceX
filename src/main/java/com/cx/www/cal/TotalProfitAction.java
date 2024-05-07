package com.cx.www.cal;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;

public class TotalProfitAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String sno = req.getParameter("sno");
		req.setAttribute("sno", sno);
		
		return "cal/profit.jsp";
	}

}
