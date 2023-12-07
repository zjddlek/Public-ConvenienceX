package com.cx.www.orders;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.AllProductDAO;
import com.cx.www.vo.AllProductVO;

public class NewProductSixAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		AllProductDAO dao = new AllProductDAO();
		ArrayList<AllProductVO> npList = dao.getSix();
		req.setAttribute("npList", npList);
		dao.close();
		return "/order/newProductSix.jsp";
	}

}
