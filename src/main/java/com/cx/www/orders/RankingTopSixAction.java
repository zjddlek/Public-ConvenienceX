package com.cx.www.orders;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.ProductRankingDAO;
import com.cx.www.vo.ProductRankingVO;

public class RankingTopSixAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		ProductRankingDAO dao = new ProductRankingDAO();
		ArrayList<ProductRankingVO> prList = dao.getSix();
		req.setAttribute("prList", prList);
		dao.close();
		return "/order/rankingTopSix.jsp";
	}

}
