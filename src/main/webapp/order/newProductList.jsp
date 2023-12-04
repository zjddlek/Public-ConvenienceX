<%@page import="com.cx.www.vo.AllProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.dao.AllProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신상품</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
<%

AllProductDAO dao = new AllProductDAO();
ArrayList<AllProductVO> list = dao.getAll();
%>
	<div class="container">
		<table class="table">
			<tr>
				<th>대분류</th>
				<th>중분류</th>
				<th>회사</th>
				<th>상품이름</th>
				<th>유통기한</th>
				<th>발주가격</th>
				<th>판매가격</th>
				<th>상품등록일자</th>
			</tr>
			<%
			 
				for (AllProductVO vo : list ) {
			%>
				<tr>
					<td><%=vo.getMcName() %></td>
					<td><%=vo.getScName() %></td>
					<td><%=vo.getAccName() %></td>
					<td><%=vo.getPName() %></td>
					<td><%=vo.getExpirydate() %>일</td>
					<td><%=vo.getPriceServer() %>원</td>
					<td><%=vo.getPriceConsumer() %>원</td>
					<td><%=vo.getRegdate() %></td>
				</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>