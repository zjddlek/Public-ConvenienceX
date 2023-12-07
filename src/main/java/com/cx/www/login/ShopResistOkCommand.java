package com.cx.www.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.ShopDAO;
import com.cx.www.vo.ShopVO;

public class ShopResistOkCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String sname = req.getParameter("sname");
		String sno = req.getParameter("postcode");
		String sloc = req.getParameter("roadaddrs");
		String bno = req.getParameter("businessNo");
		
		ShopDAO dao = new ShopDAO();
		ShopVO svo = new ShopVO(sno, sname, sloc, bno);
		dao.addOne(svo);
		
		dao.close();
		
		System.out.println("등록하러옴");
		
		return "login/login.jsp";
	}

}
