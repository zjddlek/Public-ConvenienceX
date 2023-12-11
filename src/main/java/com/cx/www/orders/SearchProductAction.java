package com.cx.www.orders;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.AllProductDAO;
import com.cx.www.vo.AllProductVO;

public class SearchProductAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		AllProductDAO dao = new AllProductDAO();
		ArrayList<AllProductVO> list = null;
		
		String searchPname = req.getParameter("pname");
		req.setAttribute("searchPname", searchPname);
		
		if ( searchPname != null ) {
			searchPname = '%'+searchPname+'%';
			list = dao.getSearchPname(searchPname);
			req.setAttribute("list", list);
		}
		
		dao.close();
		
		return "/order/searchProduct.jsp";
	}
}
