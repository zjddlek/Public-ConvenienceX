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
	
	String date = request.getParameter("salesdate");
	String sno =  request.getParameter("sno");
	
	SalesDAO dao = new SalesDAO();
	JSONArray saleArray = new JSONArray();	
	ArrayList<SalesVO> list = dao.getDateList(date, sno); 
	
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