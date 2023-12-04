package com.cx.www.discard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cxcom.cx.www.action.Action;

public class DisposeAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/dispose/disposeList.jsp";
	}

}
