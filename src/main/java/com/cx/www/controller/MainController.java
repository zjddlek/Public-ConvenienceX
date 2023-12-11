package com.cx.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.action.Action;
import com.cx.www.cal.CalMainAction;
import com.cx.www.cal.TotalProfitAction;
import com.cx.www.discard.DisposeAction;
import com.cx.www.discard.DisposeSearchDay;
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
import com.cx.www.login.FindPWCommand;
import com.cx.www.login.FindPWFormCommand;
import com.cx.www.login.LoginCommand;
import com.cx.www.login.ShopResistCommand;
import com.cx.www.login.ShopResistOkCommand;
import com.cx.www.login.WorkMainCommand;
import com.cx.www.orders.AllProductListAction;
import com.cx.www.orders.InsertOrderAction;
import com.cx.www.orders.NewProductListAction;
import com.cx.www.orders.NewProductSixAction;
import com.cx.www.orders.OrderDayListAction;
import com.cx.www.orders.OrderListAction;
import com.cx.www.orders.OrderMainAction;
import com.cx.www.orders.OrdersAction;
import com.cx.www.orders.ProductRankingListAction;
import com.cx.www.orders.RankingTopSixAction;
import com.cx.www.orders.SearchProductAction;
import com.cx.www.sales.SalesAction;
import com.cx.www.stock.StockListAction;


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
		
		System.out.println("메인컨트롤러 입니다.");
		System.out.println("type : "+type);
		
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
		else if(type.equals("findPWForm")) {
			Action ac = new FindPWFormCommand();
			url = ac.execute(req, resp);
		}
		else if(type.equals("findPW")) {
			Action ac = new FindPWCommand();
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
		}else if(type.equals("workmain")) {
			Action ac = new WorkMainCommand();
			url = ac.execute(req, resp);
		}
		
		// 정산
		else if(type.equals("calLast")) {
			Action ac = new CalLastCommand();
			url = ac.execute(req, resp);
		}
		
		// 폐기- 밝음
		else if(type.equals("dispose")) {
			Action ac = new DisposeAction();
			url = ac.execute(req, resp);
		}
		else if(type.equals("disposeSearch")) {
			Action ac = new DisposeSearchDay();
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
			RegisterOkAction ac = new RegisterOkAction();
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
			ModifyOkAction ac = new ModifyOkAction();
	    	  url=ac.execute(req,resp);	  
	    	  
	    }
		else if(type.equals("delete")) {
			Action ac = new DeleteAction();
	    	  url=ac.execute(req,resp);	  
	    }		
		
		
		// 발주 - 석원
		else if (type.equals("orders")) {
			Action ac = new OrdersAction();
			Action ac1 = new NewProductSixAction();
			Action ac2 = new RankingTopSixAction();
			Action ac3 = new OrderMainAction();
			ac1.execute(req, resp);
			ac2.execute(req, resp);
			ac3.execute(req, resp);
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
		} else if (type.equals("insertOrders")) {
			Action ac = new InsertOrderAction();
			url = ac.execute(req, resp);
		} else if (type.equals("orderList")) {
			Action ac = new OrderListAction();
			url = ac.execute(req, resp);
		} else if (type.equals("orderDayList")) {
			Action ac = new OrderDayListAction();
			url = ac.execute(req, resp);
		}
		
		//판매리스트 - 미선
		else if(type.equals("sales")) {
			Action sa = new SalesAction();
			url = sa.execute(req, resp);
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
		}
		//메인페이지로
		else if(type.equals("main")) {
			url="main/main.jsp";
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
