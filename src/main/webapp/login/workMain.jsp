<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	#attendance{
		margin-right: 5px;
		width:80px;
	}
	#back{
		margin-left: 5px;
		width:100px;
	}
	.table{
		margin-left: auto;;
		margin-right: auto;
	}
</style>
</head>
<body>
		<jsp:include page="/main/nav.jsp"></jsp:include>
	<div class="container">

		<div class="text-center">
			<h3>출퇴근 기록</h3>
		</div>
		<div>
			<table class="table table-bordered table-striped text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>직책</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
						<th>퇴근여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.ename }</td>
							<c:if test="${vo.jobno == 400 }">
								<td>점장</td>
							</c:if>
							<c:if test="${vo.jobno == 300 }">
								<td>매니저</td>
							</c:if>
							<c:if test="${vo.jobno == 200 }">
								<td>정직원</td>
							</c:if>
							<c:if test="${vo.jobno == 100 }">
								<td>아르바이트</td>
							</c:if>
	
							<td>${vo.attstart }</td>
							<td>${vo.attend }</td>
							
								<c:if test="${vo.attend == null }">
									<td><a
										href="mc?type=calLast&empno=${vo.empno }&sno=${svo.sno }"> <input
											type="button" value="정산하기" />
									</a></td>
								</c:if>
								<c:if test="${vo.attend != null }">
									<td><h5>퇴근 완료</h5></td>
								</c:if>
							
						</tr>
					</c:forEach>
				</tbody>
				
				<div class="form-group mb-3 d-flex justify-content-end">
					<div class="form-floating  text-left" >
						<a href="mc?type=attendanceLogin&sno=${svo.sno }"> 
						<input type="button" class="form-control btn btn-primary rounded float-right" value="출근" id="attendance" />
						</a>
					</div>
					<div class="form-floating  text-left">
						<a href="mc?type=main&sno=${svo.sno }"> 
							<input type="button" class="form-control btn btn-success rounded pull-right" value="돌아가기" id="back" />
						</a>
					</div>
				</div>
				<tr>
					<td colspan='1' style='text-align: end'>
						<nav aria-label="Page navigation">
							  <ul class="pagination justify-content-center">
							    <li class="page-item"><a class="page-link" href="mc?type=workmain&sno=${svo.sno }&cp=1">첫 페이지로</a></li>
							  </ul>
						</nav>
					</td>
					<td colspan='3' style='text-align: center'>
						<nav aria-label="Page navigation">
						  <ul class="pagination justify-content-center">
						    <li class="page-item"><a class="page-link" href="mc?type=workmain&sno=${svo.sno }&cp=${currentPage -1 }">Previous</a></li>
						    <c:forEach var="i" begin="${startPage }" end="${endPage }" >
						    <li class="page-item"><a class="page-link" href="mc?type=workmain&sno=${svo.sno }&cp=${i }">${i }</a></li>
							</c:forEach>
						    <li class="page-item"><a class="page-link" href="mc?type=workmain&sno=${svo.sno }&cp=${currentPage +1 }">Next</a></li>
						  </ul>
						</nav>
					</td>
					<td colspan='1' >
						<nav aria-label="Page navigation">
							  <ul class="pagination justify-content-center">
							    <li class="page-item"><a class="page-link" href="mc?type=workmain&sno=${svo.sno }&cp=${totalPage }">마지막 페이지로</a></li>
							  </ul>
						</nav>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>