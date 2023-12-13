<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.vo.StockVO"%>
<%@page import="com.cx.www.dao.StockDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %> 
<%
	String scno = request.getParameter("scno");
	String sno = request.getParameter("sno");

	StockDAO stdao = new StockDAO();
	JSONArray stArray = new JSONArray();
	
	if(scno != null){
		ArrayList<StockVO> list = stdao.getSelectAllStockNo(scno, sno);
		for(StockVO vo : list){
			JSONObject stockObject = new JSONObject();
				
			stockObject.put("stockNo",vo.getStockNo());		
			stockObject.put("pname",vo.getPname());		
			stockObject.put("price_consumer",vo.getPrice_consumer());		
			stockObject.put("stock_count",vo.getStockCount());
				
			stArray.add(stockObject);
		}
		
		// 출력
		out.println(stArray.toJSONString());
		
	}
	else{
		ArrayList<StockVO> list = stdao.getAllStock(sno);
		
		for(StockVO vo : list){
			JSONObject saleObject = new JSONObject();
				
			saleObject.put("stockNo",vo.getStockNo());		
			saleObject.put("pname",vo.getPname());		
			saleObject.put("price_consumer",vo.getPrice_consumer());		
			saleObject.put("stock_count",vo.getStockCount());
				
			stArray.add(saleObject);
		}
		
		// 출력
		out.println(stArray.toJSONString());
		
	}
	
	// 사용하면 꼭 닫아주기!
	stdao.close();

%>