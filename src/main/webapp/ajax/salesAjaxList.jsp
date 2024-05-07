<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.cx.www.vo.AllProductVO"%>
<%@page import="com.cx.www.vo.SalesVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.dao.SalesDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 
	String salesDate = request.getParameter("salesDate");
	String sno = request.getParameter("sno");
	
	JSONArray saleArray = new JSONArray();
	SalesDAO dao = new SalesDAO();
	
	
	ArrayList<SalesVO> list = dao.getSalesList(salesDate);
	
	for(SalesVO vo : list){
		
		JSONObject saleObject = new JSONObject();
		
		saleObject.put("saleno",vo.getSaleno());
		saleObject.put("date",vo.getSalesdate());
		saleObject.put("stockno",vo.getStockno());
		saleObject.put("cnt",vo.getCnt());
		saleObject.put("dealno",vo.getDealno());
		saleObject.put("isrefund",vo.getIsrefund());
		saleObject.put("pname",vo.getPname());
		saleObject.put("price_consumer",vo.getPrice_consumer());
		saleObject.put("cost",vo.getCost());
		saleObject.put("total",vo.getTotal());
		
		saleArray.add(saleObject);
	}
	
	// 출력
	out.println(saleArray.toJSONString());

	
	// 사용하면 꼭 닫아주기!
	dao.close();

%>