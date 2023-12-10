<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.cx.www.vo.SubCategoryVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.dao.SubCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String mcno = request.getParameter("mcno");

	SubCategoryDAO subdao = new SubCategoryDAO();
	ArrayList<SubCategoryVO> list = subdao.GetAll(mcno);
	
	JSONArray subArray = new JSONArray();
	
	for(SubCategoryVO vo : list){
		JSONObject saleObject = new JSONObject();
		
		saleObject.put("scNo",vo.getScNo());
		saleObject.put("mcNo", vo.getMcNo());		
		saleObject.put("scName", vo.getScName());		
		
		subArray.add(saleObject);
	}
	 
	// 출력
	out.println(subArray.toJSONString());
	
	// 사용하면 꼭 닫아주기!
	subdao.close();


%>