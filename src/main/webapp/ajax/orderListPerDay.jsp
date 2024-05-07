<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.cx.www.vo.OrderListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.dao.OrderListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	OrderListDAO dao = new OrderListDAO();
	 
	String sno = request.getParameter("sno");
	String yyyyMMdd = request.getParameter("date");
	
	yyyyMMdd = yyyyMMdd + '%';
	
	int totalCount = dao.getShopDayCount(sno, yyyyMMdd);
	int recordPerPage = 15;
	int totalPage = totalCount % recordPerPage == 0 ? totalCount / recordPerPage : totalCount / recordPerPage + 1;
	int currentPage = 0;
	String cp = request.getParameter("cp");
	currentPage = cp != null ? Integer.parseInt(cp) : 1;
	int startNo = recordPerPage * ( currentPage - 1 );
	int endNo = recordPerPage * currentPage;
	int startPage = 1;
	int endPage = totalPage;
	startPage = currentPage <= 5 ? 1 : currentPage - 4;
	if ( totalPage - currentPage <= 5 ) endPage = totalPage;
	else { 
		if ( currentPage <= 5 ) endPage = totalPage > 10 ? 10 : totalPage;
		else endPage = currentPage + 4;
	}
	
	
	ArrayList<OrderListVO> list = dao.getShopDay(sno, yyyyMMdd, startNo, recordPerPage);
	
	JSONArray jsonArray = new JSONArray();
	
	for ( OrderListVO vo : list ) {
		JSONObject jsonObject = new JSONObject(); 
		jsonObject.put("mcno" , vo.getMcno());
		jsonObject.put("scno" , vo.getScno());
		jsonObject.put("pnoAccount" , vo.getPnoAccount());
		jsonObject.put("pno" , vo.getPno());
		jsonObject.put("pnoInfo" , vo.getPnoInfo());
		jsonObject.put("ordno" , vo.getOrdno());
		jsonObject.put("ordDate" , vo.getOrdDate());
		jsonObject.put("ordCount" , vo.getOrdCount());
		jsonObject.put("sno" , vo.getSno());
		jsonObject.put("manudate" , vo.getManudate());
		jsonObject.put("tCount" , vo.getTCount());
		jsonObject.put("regdate" , vo.getRegdate());
		jsonObject.put("priceConsumer" , vo.getPriceConsumer());
		jsonObject.put("pname" , vo.getPname());
		jsonObject.put("priceServer" , vo.getPriceServer());
		if (vo.getExpirydate() != null) {
			jsonObject.put("expirydate" , vo.getExpirydate());
		} else {
			jsonObject.put("expirydate" , " ");
		}
		jsonObject.put("accno" , vo.getAccno());
		jsonObject.put("scname" , vo.getScname());
		jsonObject.put("mcname" , vo.getMcname());
		jsonObject.put("sname" , vo.getSname());
		
		jsonArray.add(jsonObject);
	}
	
	out.println(jsonArray.toJSONString());
	
	request.setAttribute("list", list);
	request.setAttribute("totalCount", totalCount);
	request.setAttribute("recordPerPage", recordPerPage);
	request.setAttribute("totalPage", totalPage);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("startNo", startNo);
	request.setAttribute("endNo", endNo);
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
	request.setAttribute("sno", sno);
	request.setAttribute("yyyyMMdd", yyyyMMdd);
	
	dao.close();

%>