
<%@page import="com.cx.www.vo.AllProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cx.www.dao.AllProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 상품 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
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
				<th>이익률</th>
				<th>상품등록일자</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.mcName }</td>
					<td>${vo.scName }</td>
					<td>${vo.accName }</td>
					<td>${vo.PName }</td>
					<td>${vo.expirydate }</td>
					<td>${vo.priceServer }</td>
					<td>${vo.priceConsumer }</td>
					<td><fmt:formatNumber value="${(vo.priceConsumer-vo.priceServer) / vo.priceServer *100 }" pattern=".0" />%</td>
					<td>${vo.regdate }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan='2' style='text-align: end'>
					<nav aria-label="Page navigation">
						  <ul class="pagination justify-content-center">
						    <li class="page-item"><a class="page-link" href="mc?type=allProducts&cp=1">첫 페이지로</a></li>
						  </ul>
					</nav>
				</td>
				<td colspan='5' style='text-align: center'>
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					    <li class="page-item"><a class="page-link" href="mc?type=allProducts&cp=${currentPage -1 }">Previous</a></li>
					    <c:forEach var="i" begin="${startPage }" end="${endPage }" >
					    <li class="page-item"><a class="page-link" href="mc?type=allProducts&cp=${i }">${i }</a></li>
						</c:forEach>
					    <li class="page-item"><a class="page-link" href="mc?type=allProducts&cp=${currentPage +1 }">Next</a></li>
					  </ul>
					</nav>
				</td>
				<td colspan='2' >
					<nav aria-label="Page navigation">
						  <ul class="pagination justify-content-center">
						    <li class="page-item"><a class="page-link" href="mc?type=allProducts&cp=${totalPage }">마지막 페이지로</a></li>
						  </ul>
					</nav>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>