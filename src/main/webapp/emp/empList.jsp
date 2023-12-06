<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP MAIN</title>
</head>
<body>
	<div class="container">
		<form action="mc">
			<h2>사원정보 조회</h2>
			<div>
				<span>성명</span> 
				<input type="text" name="name" id="name" />
				<input type="hidden" name="type" value="emp" />
			
				<span>근무기간</span>
				<input type="date" name="period" id="period" />- <input type="date" name="period2" id="period2" />
			
				<input type="submit" value="검색" class="btn btn-primary" />
				<a href="mc?type=register"><input type="button" class="btn btn-primary" value="사원등록" /></a>
			</div>
		</form>
	</div>
	<div class="container">

	
		<table class="table">
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
			
			<c:if test="${list != null }">
				<c:forEach var="vo" items="${list}">
				<tr>
               		<td><a href="mc?type=detail&empno=${vo.empno }">${vo.empno }</a></td>
					<td>${vo.ename }</td>
					<td>${vo.phone }</td>
					<td>${vo.address }</td>
				</tr>
			</c:forEach>
			</c:if>
			
			
			<c:if test="${list == null }">
				<tr>
					
					<td><a href="mc?type=detail&empno=${vo.empno}">${vo.empno }</a></td>
					<td>${vo.ename }</td>
					<td>${vo.phone }</td>
					<td>${vo.address }</td>
					
				</tr>
			</c:if>
			
		
			
			
		</table>
	</div>
</body>
</html>