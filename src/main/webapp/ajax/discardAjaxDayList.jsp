<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.cx.www.vo.DiscardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.dao.DiscardDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 
	JSONArray listArray = new JSONArray();
	DiscardDAO dao = new DiscardDAO();
	
	String discardDate = request.getParameter("date") ;  
	String sno = "0"+request.getParameter("sno") ;
	
	ArrayList<DiscardVO> list = dao.getOneday(discardDate, sno);
	dao.close();

	for(DiscardVO vo : list){
		JSONObject discard = new JSONObject();
		
		discard.put("discardNo", vo.getDiscardNo());
		discard.put("stockNO", vo.getStockNO());
		discard.put("pName", vo.getPname());
		discard.put("discardCount", vo.getDiscardCount());
		discard.put("priceServer", vo.getPriceServer());
		discard.put("sum", vo.getSum());
		discard.put("accName", vo.getAccName());
		discard.put("discardDate", vo.getDiscardDate());
		
		listArray.add(discard);		
	}
	
	out.println(listArray.toJSONString());
%>