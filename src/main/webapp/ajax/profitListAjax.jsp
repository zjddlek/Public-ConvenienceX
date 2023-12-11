<%-- <%@page import="com.cx.www.dao.ProfitDAO"%>
<%@page import="com.cx.www.vo.ProfitVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
	String calno1 = request.getParameter("calno");
	System.out.println("calno:"+calno1);
	
	String attno = request.getParameter("attno");
	String calculate1=request.getParameter("calculate");
	String caltime= request.getParameter("caltime");
	String salesamount1= request.getParameter("salesamount");
	String difference1= request.getParameter("difference");

/* 	
	int calno=Integer.parseInt(calno1);
	int calculate=Integer.parseInt(calculate1);
	int salesamount=Integer.parseInt(salesamount1);
	int difference=Integer.parseInt(difference1);
			 */
			 
			 
	ProfitDAO dao = new ProfitDAO();
	JSONArray prArray = new JSONArray();
		 
			 
	ArrayList<ProfitVO> list = dao.getList();
	
	for(ProfitVO vo: list){
		
		JSONObject profitListObject = new JSONObject();
		profitListObject.put("calno",vo.getCalno );
		profitListObject.put("attno",vo.getAttno );
		profitListObject.put("calculate",vo.getCalculate );
		profitListObject.put("caltime",vo.getCaltime );
		profitListObject.put("salesamount",vo.getSalesamount );
		profitListObject.put("difference",vo.getDiffrence );

		
		
		prArray.add(profitListObject);
	}
	
	
	
	
	System.out.println(profitListObject.toJSONString());
    
    %> --%>