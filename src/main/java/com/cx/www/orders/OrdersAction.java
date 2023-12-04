package com.cx.www.orders;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cxcom.cx.www.action.Action;

public class OrdersAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		return "order/order.jsp";
	}
	
}
