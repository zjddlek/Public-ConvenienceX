package com.cx.www.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cx.www.action.Action;
import com.cx.www.dao.CalDAO;
import com.cx.www.dao.EmpDAO;
import com.cx.www.dao.ShopDAO;
import com.cx.www.dao.SubCategoryDAO;
import com.cx.www.vo.DailySalesVO;
import com.cx.www.vo.EmpVO;
import com.cx.www.vo.ShopVO;
import com.cx.www.vo.SubCategorySalesVO;

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
			
			SubCategoryDAO scdao = new SubCategoryDAO();
			ArrayList<SubCategorySalesVO> SCSlist = scdao.getAllTop(sno);
			CalDAO cdao = new CalDAO();
			ArrayList<DailySalesVO> DSlist = cdao.dailyCal(sno);
			sdao.close();
			
			dao.close();
			
			HttpSession session = req.getSession();
			session.setAttribute("svo", svo);

			req.setAttribute("vo", vo);
			session.setAttribute("SCSlist", SCSlist);
			session.setAttribute("DSlist", DSlist);
			
			
			cdao.close();
			scdao.close();
			
			
			
			return "main/main.jsp";
		}
	}

}
