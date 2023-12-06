package com.cx.www.discard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.DiscardDAO;
import com.cx.www.vo.DiscardVO;

public class disposeSearch implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String date = req.getParameter("date");
		String shopNo = req.getParameter("shopNo");
		
		DiscardDAO dao = new DiscardDAO();
		ArrayList<DiscardVO> list = dao.getOneday(date, shopNo);
		dao.close();
		
		req.setAttribute("list", list);
		
		return "/dispose/disposeList.jsp";
	}

}
