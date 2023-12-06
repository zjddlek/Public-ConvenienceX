<%@page import="com.cx.www.vo.SalesVO"%>
<%@page import="com.cx.www.dao.SalesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %> 
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SalesDAO dao = new SalesDAO();

	String date = request.getParameter("salesdate");
	System.out.println("salesdate_action : " + date);
	
	if ( date == null  ) {
		
		ArrayList<SalesVO> list = dao.getAll();
		
		for(int i = 0; i < list.size(); i++){
			out.println(list.get(i).getSalesdate());
			out.println(list.get(i).getSaleno());
			
			if(i != list.size()-1){
				out.println(",");	
			}
		}
		
		// 사용하면 꼭 닫아주기!
		dao.close();
	}
	else if ( date != null  ){
		ArrayList<SalesVO> list = dao.getDateList(date);
		
		for(int i = 0; i < list.size(); i++){
			out.println(list.get(i).getSdate());
			out.println(list.get(i).getSaleno());
			out.println(list.get(i).getSalesdate());
			
			if(i != list.size()-1){
				out.println(",");	
			}
		}
		
		// 사용하면 꼭 닫아주기!
		dao.close();
	}
	
	// 넘겨줄 값이 있어서 요청객체에 담기
	/* request.setAttribute("list", list);
	
	System.out.println("Action: " +list);
	
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage" ,endPage);
	 */
%>