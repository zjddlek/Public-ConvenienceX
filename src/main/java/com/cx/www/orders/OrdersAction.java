package com.cx.www.orders;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.AllProductDAO;
import com.cx.www.dao.ProductRankingDAO;
import com.cx.www.vo.AllProductVO;
import com.cx.www.vo.ProductRankingVO;

import cxcom.cx.www.action.Action;

public class OrdersAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ProductRankingDAO prDao = new ProductRankingDAO();
		ArrayList<ProductRankingVO> prList = prDao.getSix();
		req.setAttribute("prList", prList);
		prDao.close();
		
		AllProductDAO apDao = new AllProductDAO();
		ArrayList<AllProductVO> npList = apDao.getSix();
		req.setAttribute("npList", npList);
		apDao.close();
		
		
		
		return "/order/order.jsp";
	}
	
}

