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
			ShopDAO sdao = new ShopDAO();
			String sno = vo.getSno();
			ShopVO svo = sdao.getOne(sno);
			sdao.close();
			
			dao.close();
			//System.out.println(vo.getSno());
			
			req.setAttribute("svo", svo);
			req.setAttribute("vo", vo);
			return "main/main.jsp";
		}
	}

}
