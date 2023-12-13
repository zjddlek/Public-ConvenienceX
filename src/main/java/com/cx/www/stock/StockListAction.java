package com.cx.www.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.cx.www.action.Action;
import com.cx.www.dao.EmpDAO;
import com.cx.www.dao.ShopDAO;
import com.cx.www.dao.StockDAO;
import com.cx.www.vo.ShopVO;
import com.cx.www.vo.StockVO;

public class StockListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String sno = req.getParameter("sno");
		req.setAttribute("sno", sno);
		
		return "/stock/stockList.jsp";
	}
	
}
