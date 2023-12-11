<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calMain</title>
</head>
<body>
	<div class="container">
		<jsp:include page="/main/nav.jsp"></jsp:include>
		
		<h2 style="text-align: center;">정산</h2>
		<a href="mc?type=calLast"><input type="button" value="중간/마감정산"/></a>
		<a href="mc?type=profit"><input type="button" value="매출현황"/></a> 
	</div>
</body>
</html>