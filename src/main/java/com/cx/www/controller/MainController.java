package com.cx.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.cal.CalMainAction;
import com.cx.www.cal.TotalProfitAction;
import com.cx.www.discard.DisposeAction;
import com.cx.www.discard.disposeSearch;
import com.cx.www.emp.DeleteAction;
import com.cx.www.emp.DetailAction;
import com.cx.www.emp.ListAction;
import com.cx.www.emp.ModifyAction;
import com.cx.www.emp.ModifyOkAction;
import com.cx.www.emp.RegisterAction;
import com.cx.www.emp.RegisterOkAction;
import com.cx.www.login.AttendCommand;
import com.cx.www.login.AttendanceLoginCommand;
import com.cx.www.login.AttendanceLoginOkCommand;
import com.cx.www.login.CalLastCommand;
import com.cx.www.login.EmpAddOneCommand;
import com.cx.www.login.LoginCommand;
import com.cx.www.login.ShopResistCommand;
import com.cx.www.login.ShopResistOkCommand;
import com.cx.www.orders.AllProductListAction;
import com.cx.www.orders.NewProductListAction;
import com.cx.www.orders.OrdersAction;
import com.cx.www.orders.ProductRankingListAction;
import com.cx.www.orders.SearchProductAction;
import com.cx.www.sales.SalesAction;
import com.cx.www.sales.SalesListAction;
import com.cx.www.stock.StockListAction;

import cxcom.cx.www.action.Action;


@WebServlet("/mc")
public class MainController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPro(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPro(req,resp);
	}

	private void doPro(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 1. 한글처리
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		// 2. type 파라미터값 가져오기
		String type = req.getParameter("type");
		
		String url = "";
		
		boolean isRedirect = false;
		
		// 로그인 - 은총
		if (type == null) {
			url = "login/login.jsp";
		}
		else if(type.equals("login")) {
			Action ac = new LoginCommand();
			url = ac.execute(req, resp);
		}
		
		// 점포
		else if(type.equals("shopResist")) {
			Action ac = new ShopResistCommand();
			url=ac.execute(req, resp);
		}
		else if(type.equals("shopResistOk")) {
			Action ac = new ShopResistOkCommand();
			url=ac.execute(req, resp);
		}
		
		// 점장등록
		else if(type.equals("empAddOne")) {
			Action ac = new EmpAddOneCommand();
			url=ac.execute(req, resp);
		}
		
		// 출퇴근
		else if(type.equals("attendanceLogin")) {
			Action ac = new AttendanceLoginCommand();
			url=ac.execute(req, resp);
		}
		else if(type.equals("attendanceLoginOk")) {
			Action ac = new AttendanceLoginOkCommand();
			url=ac.execute(req, resp);
		}
		else if(type.equals("attend")) {
			Action ac = new AttendCommand();
			url=ac.execute(req, resp);
		}
		
		// 정산
		else if(type.equals("calLast")) {
			Action ac = new CalLastCommand();
			url = ac.execute(req, resp);
		}
		
		// 폐기- 밝음

		else if(type.equals("main")) { 
			Action ac = new DisposeAction();
			url = ac.execute(req, resp);
		}
		else if(type.equals("dispose")) {
			Action ac = new DisposeAction();
			url = ac.execute(req, resp);
		}
		else if(type.equals("disposeSearch")) {
			Action ac = new disposeSearch();
			url = ac.execute(req, resp);
		}
		
		// 인사 - 수진
		else if(type.equals("emp")) {
			Action ac = new ListAction();
			url = ac.execute(req,resp);
			
		}
		else if(type.equals("register")) {
			Action ac = new RegisterAction();
			url = ac.execute(req,resp);
			
		}
		else if(type.equals("registerOk")) {
			Action ac = new RegisterOkAction();
			url = ac.execute(req,resp);
		}
		else if(type.equals("detail")) {
			Action ac = new DetailAction();
	    	  url=ac.execute(req,resp);
	    	  
	    }
		else if(type.equals("modify")) {
			Action ac = new ModifyAction();
	    	  url=ac.execute(req,resp);
	    	  
	    }
		else if(type.equals("modifyOk")) {
			Action ac = new ModifyOkAction();
	    	  url=ac.execute(req,resp);	  
	    	  
	    }
		else if(type.equals("delete")) {
			Action ac = new DeleteAction();
	    	  url=ac.execute(req,resp);
	    	  
	    }
		
		
		
		
		// 발주 - 석원
		else if (type.equals("orders")) {
			Action ac = new OrdersAction();
			url = ac.execute(req, resp);
		} else if (type.equals("allProducts")) {
			Action ac = new AllProductListAction();
			url = ac.execute(req, resp);
		} else if (type.equals("newProducts")) {
			Action ac = new NewProductListAction();
			url = ac.execute(req, resp);
		} else if (type.equals("productRank")) {
			Action ac = new ProductRankingListAction();
			url = ac.execute(req, resp);
		} else if (type.equals("searchProduct")) {
			Action ac = new SearchProductAction();
			url = ac.execute(req, resp);
		}
		
		//판매리스트 - 미선
		else if(type.equals("sales")) {
			Action sa = new SalesAction();
			url = sa.execute(req, resp);
		}
		else if (type.equals("sales_list")){
			 Action ac = new SalesListAction();
			 url = ac.execute(req, resp);
		}
		else if (type.equals("sales_detail")) {
			 Action ac = new SalesListAction();
			 url = ac.execute(req, resp);
		}
		
		// 재고
		else if (type.equals("stock")) {
			Action ac = new StockListAction();
			url = ac.execute(req, resp);
		}
		
		// 매출현황 - 정산/매출현황
		else if (type.equals("calMain")) {
			Action ac = new CalMainAction();
			url = ac.execute(req, resp);
		}
		else if (type.equals("profit")) {
			Action ac = new TotalProfitAction();
			url = ac.execute(req, resp);
		}
		
		// 부대비용관리
		else if (type.equals("etc")) {
			
		}
		
		
		// forward
		if( isRedirect ) {
			resp.sendRedirect("mc");
		}
		else {			
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
		}
		
	}
}
