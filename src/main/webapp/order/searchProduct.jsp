<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script src="./js/orderCookie.js"></script>
</head>
<body>
	<div><jsp:include page="/main/nav.jsp"></jsp:include></div>
	<div class="container">
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
					<c:set var="pname" value="${vo.PName }" />
						<c:if test="${fn:length(pname) >= 34 }">
							<td  class="pname" value="${vo.PName }">${fn:substring(pname, 0, 33) }...</td>
						</c:if>
						<c:if test="${fn:length(pname) < 34 }">
							<td  class="pname" value="${vo.PName }">${vo.PName }</td>
						</c:if>
					<td>${vo.expirydate }</td>
					<td class="priceServer">${vo.priceServer }</td>
					<td>${vo.priceConsumer }</td>
					<td><fmt:formatNumber value="${(vo.priceConsumer-vo.priceServer) / vo.priceServer *100 }" pattern=".0" />%</td>
					<td><c:set var="date" value="${vo.regdate }" />	${fn:substring(date, 0, 10) }</td>
					<td><input type="button" id="${vo.PNo }" value="발주 리스트에 추가" class="addOrder" /></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan='2' style='text-align: end'>
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="mc?type=searchProduct&pname=${searchPname }&sno=${svo.sno }&cp=1">첫 페이지로</a></li>
						</ul>
					</nav>
				</td>
				<td colspan='6' style='text-align: center'>
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<c:if test="${currentPage > 1}">
								<li class="page-item"><a class="page-link" href="mc?type=searchProduct&pname=${searchPname }&sno=${svo.sno }&cp=${currentPage -1 }">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<li class="page-item"><a class="page-link" href="mc?type=searchProduct&pname=${searchPname }&sno=${svo.sno }&cp=${i }">${i }</a></li>
							</c:forEach>
							<c:if test="${currentPage < totalPage}">
								<li class="page-item"><a class="page-link" href="mc?type=searchProduct&pname=${searchPname }&sno=${svo.sno }&cp=${currentPage +1 }">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</td>
				<td colspan='2'>
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="mc?type=searchProduct&pname=${searchPname }&sno=${svo.sno }&cp=${totalPage }">마지막 페이지로</a></li>
						</ul>
					</nav>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="2"><a href="mc?type=orders&sno=${svo.sno }"> <input type="button" class="btn btn-secondary" value="발주 리스트로 돌아가기"></a></td>
			</tr>
		</table>
	</div>
</body>
</html>