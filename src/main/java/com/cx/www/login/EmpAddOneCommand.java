package com.cx.www.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;

public class EmpAddOneCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		return "login/testemp.jsp";
	}
	
}
