<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body class="text-center">
	<div class="container">
		<div>
			<h2>ConvenienceX</h2>
		</div>
		<form action="mc" method="post">
			<div class="form-floating">
				<input type="text" name="id" id="" placeholder="아이디" />
				<input type="hidden" name="type" value="login"/>
			</div>
			<div class="form-floating">
				<input type="password" name="pwd" id="" placeholder="패스워드" />
			</div>
			<div>
				<input type="submit" value="로그인하기" />
			</div>
			<div>
				<a href="mc?type=shopResist">점포등록하러가기</a>
			</div>
		</form>
	</div>
</body>
</html>