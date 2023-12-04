<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폐기리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<h3>폐기 검색 </h3>
	
	<form action="mc">
		<input type="text" name="date" id="date" />날짜
		<input type="text" name="shopNo" id="shopNo" />점주 번호
		<input type="hidden" name="type" value="disposeSearch"/>
		<input type="submit" value="검색" />
	</form>
		
	<div class="container">
		<table class="table">
			<tr>
				<th>폐기 번호</th>
				<th>재고 번호</th>
				<th>폐기 날짜</th>
			</tr>
			<c:if test="${ list != null }">
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.discardNo }</td>
						<td>${vo.stockNO }</td>
						<td>${vo.discardDate }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	
</body>
</html>