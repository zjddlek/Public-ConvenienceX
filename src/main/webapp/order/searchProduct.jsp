<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
검색 결과
</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script src="./order/orderCookie.js"></script>
</head>
<body>
	<div class="container-fluid">
		<table class="table table-striped table-hover table-sm">
			<h2>'${searchPname }'(으)로 검색한 결과</h2>
			<tr>
				<th>대분류</th>
				<th>중분류</th>
				<th>회사</th>
				<th>상품이름</th>
				<th>유통기한</th>
				<th>발주가격</th>
				<th>판매가격</th>
				<th>이익률</th>
				<th>상품등록일자</th>
				<th></th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.mcName }</td>
					<td>${vo.scName }</td>
					<td>${vo.accName }</td>
					<td class="pname">${vo.PName }</td>
					<td>${vo.expirydate }</td>
					<td class="priceServer">${vo.priceServer }</td>
					<td>${vo.priceConsumer }</td>
					<td><fmt:formatNumber value="${(vo.priceConsumer-vo.priceServer) / vo.priceServer *100 }" pattern=".0" />%</td>
					<td>${vo.regdate }</td>
					<td><input type="button" id="${vo.PNo }" value="발주 리스트에 추가" class="addOrder"/></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="2">
					<a href="mc?type=orders&sno=${svo.sno }">
						<input type="button" class="btn btn-secondary" value="발주 리스트로 돌아가기">
					</a>
				</td>
			</tr>

		</table>
	</div>
</body>
</html>