package com.cx.www.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;

public class ShopResistCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		
		return "login/shopregist.jsp";
	}

}
