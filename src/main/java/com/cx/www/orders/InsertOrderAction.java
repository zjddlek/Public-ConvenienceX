package com.cx.www.orders;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.dao.OrderDAO;
import com.cx.www.dao.ProductInfoDAO;
import com.cx.www.vo.OrderVO;
import com.cx.www.vo.ProductInfoVO;

public class InsertOrderAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyMMdd");
		String yymmdd = now.format(dtf);
		
		String sno = req.getParameter("sno");
		int no = 0;
		
		Cookie[] cookies = req.getCookies();
		String name = null, value = null;
		if ( cookies == null ) {
			try {
				resp.sendRedirect("mc?type=order");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			for ( int i = 0; i < cookies.length; i++ ) {
				if ( cookies[i].getName().equals("JSESSIONID") == false 
						&& cookies[i].getValue().equals("0") == false ) {
					no++;
					name = cookies[i].getName();
					value = cookies[i].getValue();
					int cnt = Integer.parseInt(value);
					cookies[i].setMaxAge(0);
					resp.addCookie(cookies[i]);
					
					ProductInfoDAO piDao = new ProductInfoDAO();
					ProductInfoVO piVo = piDao.getOne(name);
					int pnoInfo = piVo.getPNoInfo();
					piDao.close();
					
					OrderDAO oDao = new OrderDAO();
					OrderVO vo1 = oDao.getLastOne(sno);
					String testOrderno = vo1.getOrdno();
					
					OrderVO vo2 = new OrderVO();
					
					String ordno = null;
					vo2.setOrdCount(cnt);
					vo2.setPnoInfo(pnoInfo);
					vo2.setSno(sno);
					if ( testOrderno.substring(0,6).equals(yymmdd) ) {
						int seq = Integer.parseInt(testOrderno.substring(9));
						seq += no;
						ordno = yymmdd + sno + seq;
					} else {
						ordno = yymmdd + sno + no;
					}
					vo2.setOrdno(ordno);
					
					oDao.addOne(vo2);
					oDao.close();
				}
			}
		}
		
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderVO> list = dao.getAll();
		
		req.setAttribute("list", list);
		
		return "/order/orderList.jsp";
	}

}
