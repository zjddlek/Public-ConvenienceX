<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calMain</title>
</head>
<body> 
	<jsp:include page="/main/nav.jsp"></jsp:include>
	
	<div class="container">		
		<h2 style="text-align: center;">정산</h2>
		<a href="mc?type=calLast"><input type="button" value="중간/마감 정산"/></a>
		<a href="mc?type=calList"><input type="button" value="중간/마감 이력"/></a>
		<a href="mc?type=profit"><input type="button" value="매출 현황"/></a> 
	</div>
</body>
</html>