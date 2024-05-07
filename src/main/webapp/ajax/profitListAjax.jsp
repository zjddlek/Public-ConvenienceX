<%@page import="com.cx.www.dao.ProfitDAO"%>
<%@page import="com.cx.www.vo.ProfitVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
     
	String calno1 = request.getParameter("calno");
	
	String attno = request.getParameter("attno");
	String calculate=request.getParameter("calculate");
	String caltime= request.getParameter("caltime");
	
	String salesamount= request.getParameter("salesamount");
	String difference= request.getParameter("difference");

	/* int calno=Integer.parseInt(calno1);
	int calculate=Integer.parseInt(calculate1);
	int salesamount=Integer.parseInt(salesamount1);
	int difference=Integer.parseInt(difference1); */
			 
			 
			 
	ProfitDAO dao = new ProfitDAO();
	JSONArray prArray = new JSONArray();
		 
			 
	ArrayList<ProfitVO> list = dao.getList();
	
	for(ProfitVO vo: list){

		JSONObject profitListObject = new JSONObject();
		
		profitListObject.put("calno",vo.getCALNO());
		profitListObject.put("attno",vo.getATTNO());
		profitListObject.put("calculate",vo.getCALCULATE());
		profitListObject.put("caltime",vo.getCALTIME());
		profitListObject.put("salesamount",vo.getSALESAMOUNT());
		profitListObject.put("difference",vo.getDIFFERENCE());

		
		
		prArray.add(profitListObject);
	}
	
	
	out.println(prArray.toJSONString());
	
	
		
    
%>