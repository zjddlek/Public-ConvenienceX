package com.cx.www.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cxcom.cx.www.action.Action;

public class RegisterAction implements Action{


	public String execute(HttpServletRequest req, HttpServletResponse resp) {


		
		return "views/register.jsp";
	}

}
