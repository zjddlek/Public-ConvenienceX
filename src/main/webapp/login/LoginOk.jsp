<%@page import="com.cx.www.vo.ShopVO"%>
<%@page import="com.cx.www.dao.ShopDAO"%>
<%@page import="com.cx.www.vo.EmpVO"%>
<%@page import="com.cx.www.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	EmpDAO dao = new EmpDAO();
	EmpVO vo = dao.getOne(id,pwd);
	int jobno = vo.getJobno();
	if(vo==null||jobno!= 400) {
		response.sendRedirect("login/login.jsp");
	}else{	
		String sno = vo.getSno();
 		ShopDAO sdao = new ShopDAO();
		ShopVO svo = sdao.getOne(sno);
		
		request.setAttribute("svo", svo);
		response.sendRedirect("main.jsp");
	}

%>