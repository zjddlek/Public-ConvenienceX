<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>

<link rel="stylesheet" href="./style/order.css">
<script src="./js/order.js"></script>
<script src="./js/orderCookie.js"></script>

</head>
<body>
	<div class="container">
		<jsp:include page="/main/nav.jsp"></jsp:include> 
		
		<div style="display:flex;">
			<c:import url="./rankingTopSix.jsp"></c:import>
		
			<c:import url="./orderMain.jsp"></c:import>
			
			<c:import url="./newProductSix.jsp"></c:import>
		</div>
		
		
	</div>
</body>
</html>