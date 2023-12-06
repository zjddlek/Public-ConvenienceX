<%@page import="com.cx.www.vo.SalesVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.dao.SalesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//	String salesno = request.getParameter("salesno");
	String salesDate = request.getParameter("salesDate");
	
	SalesDAO dao = new SalesDAO();
	
	//ArrayList<SalesVO> list = dao.getSalesList(salesno);
	ArrayList<SalesVO> list = dao.getSalesList(salesDate);
	
	System.out.println("salesAjaxList: " +list);
	
/* 	for(int i = 0; i < list.size(); i++){
		out.println(list.get(i).getSalesdate());
		out.println(list.get(i).getSaleno());
		
		
		if(i != list.size()-1){
			out.println(",");	
		}
	} */
	
	// 사용하면 꼭 닫아주기!
	dao.close();
	
	request.setAttribute("s_list", list);


%>