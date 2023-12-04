package com.cx.www.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dao.EmpDAO;
import com.cx.www.dao.ShopDAO;
import com.cx.www.vo.EmpVO;
import com.cx.www.vo.ShopVO;

import cxcom.cx.www.action.Action;

public class LoginCommand implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");

		EmpDAO dao = new EmpDAO();
		EmpVO vo = dao.getOneSM(id, pwd);
		int jobno = vo.getJobno();
		if (vo == null || jobno != 400) {
			return "login/login.jsp";
		} else {
			String sno = vo.getSno();
			ShopDAO sdao = new ShopDAO();
			ShopVO svo = sdao.getOne(sno);
			dao.close();
			sdao.close();
			
			req.setAttribute("svo", svo);
			return "main/main.jsp";
		}
	}

}
