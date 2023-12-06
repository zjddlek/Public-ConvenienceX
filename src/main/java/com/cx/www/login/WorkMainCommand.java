package com.cx.www.login;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.AttendanceDAO;
import com.cx.www.dao.ShopDAO;
import com.cx.www.vo.AttendanceRecodVO;
import com.cx.www.vo.AttendanceVO;
import com.cx.www.vo.ShopVO;

public class WorkMainCommand implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String sno = req.getParameter("sno");
		AttendanceDAO dao = new AttendanceDAO();
		ArrayList<AttendanceRecodVO> list = dao.getRecordAll(sno);
		ShopDAO sdao = new ShopDAO();
		ShopVO svo = sdao.getOne(sno);
		req.setAttribute("svo", svo);
		sdao.close();
		//System.out.println(sno);
		dao.close();
		
		req.setAttribute("list", list);
		
		
		
		return "login/workMain.jsp";
	}

}
