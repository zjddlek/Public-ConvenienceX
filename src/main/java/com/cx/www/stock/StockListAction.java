package com.cx.www.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.cx.www.action.Action;
import com.cx.www.dao.StockDAO;
import com.cx.www.vo.StockVO;

public class StockListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		StockDAO stdao = new StockDAO();
		JSONArray stArray = new JSONArray();
		
		ArrayList<StockVO> list = stdao.getAllStock();
		
		req.setAttribute("sub_list", list);
		
		return "/stock/stockList.jsp";
	}
	
}
