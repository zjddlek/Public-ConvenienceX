package com.cx.www.discard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.DiscardDAO;
import com.cx.www.vo.ExpiredItemsVO;

public class ExpiredItems implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String shopNo = req.getParameter("sno");
			//System.out.println("exp action :"+shopNo);
		DiscardDAO dao = new DiscardDAO();
		ArrayList<ExpiredItemsVO> listExpired =dao.searchExpredItems(shopNo);
		dao.close();
		System.out.println(listExpired);
		req.setAttribute("expired", listExpired);
		
		return "/dispose/expiredItemsList.jsp";
	}

}
