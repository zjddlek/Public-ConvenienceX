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
		
		
		String name1 = null, value1 = null;
		String name2 = null, value2 = null;
		String name3 = null, value3 = null;
		String name4 = null, value4 = null;
		String[] values1 = null, values2 = null, values3 = null, values4 = null;
		Cookie[] cookies = req.getCookies();
		if ( cookies != null ) {
			for ( Cookie c : cookies ) {
				if ( c.getName().equals("pno1") && c.getName() != null && c.getValue() != null ) {
					name1 = c.getName();
					value1 = c.getValue();
				}
				if ( c.getName().equals("pno2") && c.getName() != null && c.getValue() != null  ) {
					name2 = c.getName();
					value2 = c.getValue();
				}
				if ( c.getName().equals("pno3") && c.getName() != null && c.getValue() != null  ) {
					name3 = c.getName();
					value3 = c.getValue();
				}
				if ( c.getName().equals("pno4") && c.getName() != null && c.getValue() != null  ) {
					name4 = c.getName();
					value4 = c.getValue();
				}
			}
		}
		
		ArrayList<AllProductVO> searchList = new ArrayList<AllProductVO>();
		AllProductVO vo = null;
		if (value1 != null) {
			values1 = value1.split("%2C");
			for ( String pno : values1 ) {
				vo = apDao.getSearchPno(pno);
				searchList.add(vo);
			}
		}
		if (value2 != null) {
			values2 = value2.split("%2C");
			for ( String pno : values2 ) {
				vo = apDao.getSearchPno(pno);
				searchList.add(vo);
			}
		}
		if (value3 != null) {
			values3 = value3.split("%2C");
			for ( String pno : values3 ) {
				vo = apDao.getSearchPno(pno);
				searchList.add(vo);
			}
		}
		if (value4 != null) {
			values4 = value4.split("%2C");
			for ( String pno : values4 ) {
				vo = apDao.getSearchPno(pno);
				searchList.add(vo);
			}
		}
		
		req.setAttribute("searchList", searchList);
		
		apDao.close();
		
		return "/order/order.jsp";
	}
	
}

