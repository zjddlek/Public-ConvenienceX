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
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<table class="table table-striped table-bordered">
			<tr>
				<th colspan="3" class="text-center" >현금</th>
			</tr>
			<tr>
				<th>권종</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
			<tr>
				<th>50000원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>10000원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>5000원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>1000원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>500원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>100원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>50원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>10원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th colspan="2">합계</th>
				<td></td>
			</tr>
			<tr>
				<th colspan="2">매출액</th>
				<td></td>
			</tr>
			<tr>
				<th colspan="2">차액</th>
				<td></td>
			</tr>
		</table>
		<table class="table table-striped table-bordered">
			<tr>
				<th colspan="3" class="text-center">상품권</th>
			</tr>
			<tr>
				<th>권종</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
			<tr>
				<th>50000원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>10000원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>5000원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
			<tr>
				<th>1000원</th>
				<td><input type="text" name="" id="" /></td>
				<td></td>
			</tr>
				<tr>
				<th colspan="2">합계</th>
				<td></td>
			</tr>
			<tr>
				<th colspan="2">매출액</th>
				<td></td>
			</tr>
			<tr>
				<th colspan="2">차액</th>
				<td></td>
			</tr>
		</table>
		<a href="mc?type=attend&empno=<%=request.getParameter("empno")%>"><input
			type="button" value="정산하기" /> <input type="hidden" name="empno"
			value="<%=request.getParameter("empno")%>" /></a>
	</div>

</body>
</html>