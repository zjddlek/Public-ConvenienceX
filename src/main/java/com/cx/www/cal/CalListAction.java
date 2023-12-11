package com.cx.www.cal;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.ProfitDAO;
import com.cx.www.vo.ProfitVO;



public class CalListAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
	
		
		return "cal/calList.jsp";
	}

}
