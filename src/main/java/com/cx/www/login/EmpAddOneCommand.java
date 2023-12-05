package com.cx.www.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.ShopDAO;
import com.cx.www.vo.ShopVO;

import cxcom.cx.www.action.Action;

public class EmpAddOneCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String sno = req.getParameter("sno");
		ShopDAO sdao = new ShopDAO();
		ShopVO svo = sdao.getOne(sno);
		req.setAttribute("svo", svo);
		sdao.close();
		
		return "login/testemp.jsp";
	}
	
}
