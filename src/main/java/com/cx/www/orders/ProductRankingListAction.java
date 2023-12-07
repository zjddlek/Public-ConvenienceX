package com.cx.www.orders;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.AllProductDAO;
import com.cx.www.dao.ProductRankingDAO;
import com.cx.www.vo.AllProductVO;
import com.cx.www.vo.ProductRankingVO;

public class ProductRankingListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ProductRankingDAO dao = new ProductRankingDAO();
		
		int totalCount = dao.getTotalCount();
		int recordPerPage = 20;
		int totalPage = totalCount % recordPerPage == 0 ? totalCount / recordPerPage : totalCount / recordPerPage + 1;
		int currentPage = 0;
		String cp = req.getParameter("cp");
		currentPage = cp != null ? Integer.parseInt(cp) : 1;
		int startNo = recordPerPage * ( currentPage - 1 );
		int endNo = recordPerPage * currentPage;
		int startPage = 1;
		int endPage = totalPage;
		startPage = currentPage <= 5 ? 1 : currentPage - 4;
		if ( totalPage - currentPage <= 5 ) endPage = totalPage;
		else { 
			if ( currentPage <= 5 ) endPage = totalPage > 10 ? 10 : totalPage;
			else endPage = currentPage + 4;
		}
		
		ArrayList<ProductRankingVO> list = dao.getAll(startNo, recordPerPage);
		/* ArrayList<ProductRankingVO> list = dao.getAll(); */
		
		req.setAttribute("list", list);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("recordPerPage", recordPerPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startNo", startNo);
		req.setAttribute("endNo", endNo);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		dao.close();
		
		return "/order/productRankingList.jsp";
	}

}
