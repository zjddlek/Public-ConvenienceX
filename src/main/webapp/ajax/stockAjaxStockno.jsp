<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.vo.StockVO"%>
<%@page import="com.cx.www.dao.StockDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %> 
<%
	String scno = request.getParameter("scno");
	System.out.println(scno);

	StockDAO stdao = new StockDAO();
	JSONArray stArray = new JSONArray();
	
	if(scno != null){
		ArrayList<StockVO> list = stdao.getAllStockNo(scno);
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
	else{
		ArrayList<StockVO> list = stdao.getAllStock();
		
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