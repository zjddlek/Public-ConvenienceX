<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.vo.StockVO"%>
<%@page import="com.cx.www.dao.StockDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 
	StockDAO stdao = new StockDAO();
	JSONArray stArray = new JSONArray();
	
	ArrayList<StockVO> list = stdao.getAllStock();
	
	System.out.println(list);
	
	for(StockVO vo : list){
		JSONObject saleObject = new JSONObject();
			
		saleObject.put("stockNo",vo.getStockNo());		
		saleObject.put("stock_count",vo.getStockCount());
		saleObject.put("pnoInfo",vo.getPnoInfo());
		saleObject.put("warehousedate",vo.getWarehousedate());
		saleObject.put("pname",vo.getPname());		
		saleObject.put("mcName",vo.getMcName());		
		saleObject.put("scName",vo.getScName());		
		saleObject.put("mcNo",vo.getMcNo());		
		saleObject.put("scNo",vo.getScNo());		
		saleObject.put("price_consumer",vo.getPrice_consumer());		
			
		stArray.add(saleObject);
	}
	// 출력
	out.println(stArray.toJSONString());	
	
	// 사용하면 꼭 닫아주기!
	stdao.close();

%>