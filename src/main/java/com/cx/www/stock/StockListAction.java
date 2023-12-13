package com.cx.www.stock;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.cx.www.action.Action;
import com.cx.www.dao.EmpDAO;
import com.cx.www.dao.ShopDAO;
import com.cx.www.dao.StockDAO;
import com.cx.www.vo.ShopVO;
import com.cx.www.vo.StockVO;

public class StockListAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("재고리스트 url 태워주는 액션~");
		
		String sno = req.getParameter("sno");
		System.out.println("파라미터 sno : " +sno); // ---> 이렇게는 받아짐
		
		req.setAttribute("sno", sno);
		
		/*
		 * StockDAO stdao = new StockDAO(); JSONArray stArray = new JSONArray();
		 * 
		 * ArrayList<StockVO> list = stdao.getAllStock();
		 * 
		 * req.setAttribute("sub_list", list);
		 */
		
		
		return "/stock/stockList.jsp";
	}
	
}
