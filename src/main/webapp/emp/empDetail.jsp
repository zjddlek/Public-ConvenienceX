<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	
	
	<div class="container">
		<table class="table table-striped">
			<tr>
				<th>사원번호</th>
				<td>${vo.empno}</td>
				<th>사원이름</th>
				<td>${vo.ename}</td>
				<th>전화번호</th>
				<td>${vo.phone}</td>
			</tr>
			
			
			<tr>
				<td colspan="6">
				
				<a href="mc"><input type="button" class="btn btn-success" value="목록" /></a>
				<a href="mc?type=modify&empno=${vo.empno }"><input type="button" class="btn btn-primary" value="수정" /></a>
				<a href="mc?type=delete&empno=${vo.empno }"><input type="button" class="btn btn-danger" value="삭제" /></a>
				</td>
			</tr>
			
		</table>
	
	</div>
	
	
</body>
</html>