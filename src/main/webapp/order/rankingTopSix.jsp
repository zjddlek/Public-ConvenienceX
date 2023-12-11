<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 TOP</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<link rel="stylesheet" href="./style/order.css">
</head>
<body> --%>
	<div class="col"> <h2>매출 TOP</h2>
		<c:forEach var="vo" items="${prList }">
			<div class="prItems">
				<span>
					<c:set var="Text" value="${vo.accName }"/>
					${fn:substring(Text,0,5)}
				</span>
				<span>${vo.PName }</span>
				<span>${vo.total }개</span>
				<span>발주가격 : <fmt:formatNumber value="${vo.priceServer}" type="number" />원</span>
				<span>이익률 : <fmt:formatNumber value="${(vo.priceConsumer-vo.priceServer) / vo.priceServer *100 }" pattern=".0"/>%</span>
			</div>
		</c:forEach>
		<a href="mc?type=productRank&sno=${svo.sno }">
			<input type="button" class="btn btn-primary" value="전체 랭킹 보러가기" name="showAllProductRanking" />
		</a>
	</div>
<!-- </body>
</html> -->