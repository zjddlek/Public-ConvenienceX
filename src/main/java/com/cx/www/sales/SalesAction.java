package com.cx.www.sales;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;

public class SalesAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		return "sales/sales.jsp"; // ---> 여기서는 돌려줄 주소로 ㅇㅁㅇ~
	}

}
