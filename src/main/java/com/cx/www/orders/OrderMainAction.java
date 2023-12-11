package com.cx.www.orders;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.AllProductDAO;
import com.cx.www.vo.AllProductVO;

public class OrderMainAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		AllProductDAO dao = new AllProductDAO();
		
		String name = null, value = null;
		
		String[] values = null;
		Cookie[] cookies = req.getCookies();
		ArrayList<AllProductVO> list = new ArrayList<AllProductVO>();
		AllProductVO vo = null;
		
		if ( cookies != null ) {
			for ( Cookie c : cookies ) {
				if ( c.getName().equals("pno") && c.getName() != null && c.getValue() != null ) {
					name = c.getName();
					value = c.getValue();
					values = value.split("%2C");
					for ( String pno : values ) {
						vo = dao.getSearchPno(pno);
						list.add(vo);
					}
				}
			}
		}
		
		req.setAttribute("list", list);
		
		dao.close();
		
		return "/order/orderMain.jsp";
	}

}
