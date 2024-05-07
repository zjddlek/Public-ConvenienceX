package com.cx.www.discard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.DiscardDAO;
import com.cx.www.vo.DiscardMonthVO;
import com.cx.www.vo.DiscardVO;
 
public class DisposeSearchDay implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String date = req.getParameter("date");
		String shopNo = req.getParameter("sno");
		
		DiscardDAO dao = new DiscardDAO();

		req.setAttribute("date", date);
		
		ArrayList<DiscardMonthVO> listMonth = dao.getOneMonth(date.substring(0, 7), shopNo);
		dao.close();
		
		req.setAttribute("listMonth", listMonth);
		
		String result = "";
		
		for (DiscardMonthVO vo : listMonth) {
			if(result != "") {
				result += ",";
			}
			result += "['"+vo.getDiscardDate()+"', "+vo.getTotalsum()+"]";
		}
		
		req.setAttribute("chartdate", result);
		
		return "/dispose/disposeList.jsp";
	}

}
