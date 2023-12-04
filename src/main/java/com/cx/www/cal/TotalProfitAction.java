package com.cx.www.cal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cxcom.cx.www.action.Action;

public class TotalProfitAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		return "cal/profit.jsp";
	}

}
