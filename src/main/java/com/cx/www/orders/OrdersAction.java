package com.cx.www.orders;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.AllProductDAO;
import com.cx.www.dao.ProductRankingDAO;
import com.cx.www.vo.AllProductVO;
import com.cx.www.vo.ProductRankingVO;

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
		
		
		String name = null;
		String value = null;
		Cookie[] cookies = req.getCookies();
		if ( cookies != null ) {
			for ( Cookie c : cookies ) {
				name = c.getName();
				value = c.getValue();
			}
		}
		
		System.out.println("name : " + name + ", value : " + value);
		String[] values = value.split("%2C");
		System.out.println(Arrays.toString(values));
		
		ArrayList<AllProductVO> searchList = new ArrayList<AllProductVO>();
		for ( String pno : values ) {
			AllProductVO vo = apDao.getSearchPno(pno);
			searchList.add(vo);
		}
		req.setAttribute("searchList", searchList);
		
		apDao.close();
		
		return "/order/order.jsp";
	}
	
}

