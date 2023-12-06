<%@page import="com.cx.www.vo.SalesVO"%>
<%@page import="com.cx.www.dao.SalesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %> 
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 페이징 처리 */		
	SalesDAO dao = new SalesDAO();
	
	// 페이징처리
	// 1. 전체 게시물 건수를 출력
	int totalCount = dao.getTotalCount();
	
	// 2. 한 페이지당 게시물 의 수 - 20개 기준
	int recodePerPage = 20;
	
	// 3. 총 페이지 수 ( 전체 게시물의 수 / 한페이지당 게시물의 수 ) ---> 홀수인 경우 딱 안나누어 떨어짐 ---> 삼항연산자로 계산식 써주기
	int totalPage = ( totalCount % recodePerPage == 0 ) ?  totalCount / recodePerPage : totalCount / recodePerPage +1 ;
	
	// 4.현재 페이지 번호
	//int currentPage = 1;
	int currentPage = 0;
	
	// 4-1. 현재 페이지 번호 가져오기 - cp는 반복문안 a태그에 있음
	String cp = request.getParameter("cp");
	if(cp != null){
		currentPage = Integer.parseInt(cp);
	}
	else{
		currentPage = 1;
	}
	
	// 20씩 페이지가 증가함
	// 1페이지인 경우 - 시작번호 1, 끝번호 20
	// 2페이지인 경우 - 시작번호 21, 끝번호 40
	// 3페이지인 경우 - 시작번호 41, 끝번호 60....
	
	// 5. 시작 번호
	int starNo = (currentPage-1)*recodePerPage+1;
	
	// 6. 끝 번호 
	int endNo = currentPage*recodePerPage;
	
	// 7. 시작 페이지 번호 
	int startPage = 1; 
	
	// 8. 끝 페이지 번호  
	int endPage = totalPage;
	
	// 시작페이지 미세조정하기
	if(currentPage <= 5){ // 현재 페이지가 5보다 작거나 같은 경우 
		startPage = 1;  // 시작페이지는 1
	}
	else if(currentPage >= 6){ // 현재 페이지가 6보다 크거나 같은 경우
		startPage = currentPage-4; // 시작 페이지는 현재 페이지 -4
	}
	
	// 끝 페이지 미세조정
	if(totalPage - currentPage <= 5){ // 전체 페이지번호에서 현재 페이지를 뺀 것이 5보다 작거나 같은 경우 
		endPage = totalPage; // 끝 페이지는 전체 페이지번호
	}
	else if(totalPage - currentPage > 5) { // 전체 페이지에서 현재 페이지를 뺀 것이 5보다 큰 경우 
		if(currentPage <= 5){ // 현재 페이지가 5보다 작거나 같고 
	if(totalPage > 10){ // 전체 페이지가 10보다 큰 경우 
		endPage = 10; // 끝 페이지는 10
	}
	else { // 전체 페이지가 10보다 큰게 아니라면 
		endPage = totalPage; // 끝 페이지는 전체 페이지
	}
		}
		else{ // 현재 페이지가 5보다 작거나 같은 경우가 아니라면 
	endPage = currentPage + 4; // 끝 페이지는 현재페이지 +4
		}
	}
	
	ArrayList<SalesVO> list = dao.getAll(starNo, 7);
	
	//System.out.println("list: " +list);
	
	for(int i = 0; i < list.size(); i++){
		out.println(list.get(i).getSalesdate());
		out.println(list.get(i).getSaleno());
		
		if(i != list.size()-1){
			out.println(",");	
		}
	}
	
	// 사용하면 꼭 닫아주기!
	dao.close();
	
	// 넘겨줄 값이 있어서 요청객체에 담기
	/* request.setAttribute("list", list);
	
	System.out.println("Action: " +list);
	
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage" ,endPage);
	 */
%>