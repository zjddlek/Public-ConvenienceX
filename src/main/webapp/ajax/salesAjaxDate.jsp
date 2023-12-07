<%@page import="com.cx.www.vo.SalesVO"%>
<%@page import="com.cx.www.dao.SalesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %> 
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SalesDAO dao = new SalesDAO();
	
	String date = request.getParameter("salesdate");
	System.out.println("salesdate_action : " + date);
	
	
	JSONArray saleArray = new JSONArray();	
	ArrayList<SalesVO> list = dao.getDateList(date);
	
	System.out.println("list : " + list);
	
	for(SalesVO vo : list){
		JSONObject saleObject = new JSONObject();
		
		saleObject.put("saleno",vo.getSaleno());
		saleObject.put("getSalesdate",vo.getSalesdate());
		saleObject.put("sdate",vo.getSdate());
		
		
		saleArray.add(saleObject);
	}
	
	// 출력
	out.println(saleArray.toJSONString());
	
	// 사용하면 꼭 닫아주기!
	dao.close();

%>