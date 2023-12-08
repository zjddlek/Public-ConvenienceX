<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
#root {
	width: 1500px;
	height: 1500px;
	background-color: yellow;
}

#head {
	width: 300px;
	height: 50px;
	border: 1px solid black;
	background-color: tomato;
	position: relative;
	left: 300px;
	bottom: 20px;
}

#search {
	width: 1000px;
	height: 100px;
	border: 1px solid black;
	background-color: aqua;
	text-align: center;
	margin: auto;
	position: relative;
	top: 50px;
	
}

#table {
	width: 1500px;
	border: 1px solid black;
	height: 1000px;
	margin: auto;
	position: relative;
	top: 50px;
}
</style>
<meta charset="UTF-8">
<title>EMP MAIN</title>
</head>
<body>
	<div id="root">
		<div class="container">
			<form action="mc">
				<div id=search class="border border-primary border-3 rounded-3">
					<div id="head" class="border border-primary border-3 rounded-3">
						<h2>사원 검색</h2>
					</div>
						
						<div class="row g-3 align-items-center">
							<div class="col-auto" >
								<label for="name" class="col-form-label">사원명</label>
							</div>
							<div class="col-lg-2">								
								<input type="text" class="form-control" name="name" id="name" /> 
							</div>	
								
							<input type="hidden" name="type" value="emp" />
							
							<div class="col-lg-2 g-3 align-items-center">
								<div class="col-auto">
									<label for="period" class="col-form-label">근무기간</label>
								</div>
								<div class="col-lg-2">								
									<input type="date" class="form-control" name="period" id="period" />- 
									<input type="date" class="form-control" name="period2" id="period2" />
								</div>
							</div>
						
		
						
						
							<div class="col-lg-2">
								<input type="submit" class="btn btn-primary" value="검색" />
							</div>

							<div class="col-lg-2">

								<a href="mc?type=register"><input type="button" class="btn btn-primary" value="사원등록" /></a>
							</div>
						</div>


				</div>

			</form>
		</div>
		<div class="container border border-primary border-3 rounded-3"
			id="table">


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
							<td><a href="mc?type=detail&empno=${vo.empno}">${vo.empno }</a></td>
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
	</div>
</body>
</html>