package com.cx.www.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cxcom.cx.www.action.Action;

public class MainCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		return "login/MainEX.jsp";
	}

}
