<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.vo.MajorCategoryVO"%>
<%@page import="com.cx.www.dao.MajorCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<% 
	// 대분류 불러오기
	MajorCategoryDAO mdao = new MajorCategoryDAO();
	ArrayList<MajorCategoryVO> list = mdao.GetAll();
	
	JSONArray mArray = new JSONArray();
	
	for(MajorCategoryVO vo : list){
		JSONObject saleObject = new JSONObject();
		
		saleObject.put("mcNo",vo.getMcNo());
		saleObject.put("mcName", vo.getMcName());		
		saleObject.put("scNo", vo.getScNo());		
		
		mArray.add(saleObject);
	}
	
	// 출력
	out.println(mArray.toJSONString());
	
	// 사용하면 꼭 닫아주기!
	mdao.close();
%>