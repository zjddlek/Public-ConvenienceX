package com.cx.www.orders;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.AllProductDAO;
import com.cx.www.dao.ProductRankingDAO;
import com.cx.www.vo.AllProductVO;
import com.cx.www.vo.ProductRankingVO;

public class OrdersAction implements Action{
 
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		return "/order/order.jsp";
	}
	
}

