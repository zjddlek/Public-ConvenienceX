package com.cx.www.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.ShopDAO;
import com.cx.www.vo.ShopVO;

public class AttendanceLoginCommand implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String sno = req.getParameter("sno");
		ShopDAO sdao = new ShopDAO();
		ShopVO svo = sdao.getOne(sno);
		sdao.close();
		req.setAttribute("svo", svo);
	
		return "login/attendanceLogin.jsp";
	}

}
