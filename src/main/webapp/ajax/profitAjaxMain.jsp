<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.cx.www.vo.ProfitVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.dao.ProfitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String sno = request.getParameter("sno");
	String yyyymm = request.getParameter("yyyymm");

	ProfitDAO pdao = new ProfitDAO();

	ArrayList<ProfitVO> list = pdao.getListDay(yyyymm, sno);
	JSONArray stArray = new JSONArray();
	
	for(ProfitVO vo : list){
		JSONObject pObject = new JSONObject();
		
		pObject.put("date",vo.getDate());
		pObject.put("calday",vo.getCalday());
			
		stArray.add(pObject);
	}
	
	// 출력
	out.println(stArray.toJSONString());

	// 사용하면 꼭 닫아주기!
	pdao.close();

%>