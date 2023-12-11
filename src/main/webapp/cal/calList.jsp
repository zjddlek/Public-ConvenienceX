<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>정산 이력</title>
</head>
<script>


	
$(document).ready(function(){
	getList();
});

	function getList(){
		
		$.ajax({
			url:"ajax/profitListAjax.jsp",
		
			success:function(data){
				
				console.log(data);
			}
			
			
		})
		
	}

</script>
<body>

	<div class="container" style="padding-bottom: 20px;">
		<h2>정산 이력</h2>
		<form action="">
			<div>
				<div style="display: flex;">
					<div class="target-select__elements--control"
						style="margin-bottom: 10px; margin-right: 10px;">
						<div class="dropdown input-dropdown">
							<input type="month" />

						</div>
					</div>
				</div>



				<table class="table table-hover table-striped table-bordered">

					<tr>
						<th>상품번호</th>
						<th>근태관리번호</th>
						<th>정산구분</th>
						<th>정산시간</th>
						<th>매출액</th>
						<th>차액</th>
					</tr>

					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.calno }</td>
							<td>${vo.attno }</td>
							<td>${vo.calculate }</td>
							<td>${vo.caltime }</td>
							<td>${vo.salesamount }</td>
							<td>${vo.difference }</td>

						</tr>
					</c:forEach>


				</table>
			</div>
		</form>
	</div>

</body>
</html>