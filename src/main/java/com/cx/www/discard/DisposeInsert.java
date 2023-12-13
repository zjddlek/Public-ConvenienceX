package com.cx.www.discard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.DiscardDAO;
import com.cx.www.vo.ExpiredItemsVO;

public class DisposeInsert implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String shopNo = "0"+req.getParameter("sno");
		System.out.println(shopNo);
		DiscardDAO dao = new DiscardDAO();
		ArrayList<ExpiredItemsVO> listExpired =dao.searchExpredItems(shopNo);
		System.out.println("listExpired :"+listExpired);
		
		dao.exporedInsert(listExpired, shopNo);
		dao.close();
		
		return "/dispose/expiredItemsList.jsp";
	}

}
