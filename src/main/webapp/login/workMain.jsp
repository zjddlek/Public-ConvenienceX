<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script><%@taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
	<div class="container">
		<div class="text-center">
			<h3>출퇴근 기록</h3>
		</div>
		<table class=" table table-bordered table-striped text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>직책</th>
					<th>출근시간</th>
					<th>퇴근시간</th>
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
								href="mc?type=calLast&empno=${vo.empno }&sno=${svo.sno }"><input
									type="button" value="정산하기" /></a></td>
						</c:if>
						<c:if test="${vo.attend != null }">
							<td><h5>퇴근 완료</h5></td>
						</c:if>

					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<div>
					<a href="mc?type=attendanceLogin&sno=${svo.sno }"><input
						type="button" value="출근" /></a> <a
						href="mc?type=main&sno=${svo.sno }"><input type="button"
						value="돌아가기" /></a>
				</div>
			</tfoot>
		</table>
	</div>
</body>
</html>