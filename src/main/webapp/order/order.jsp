<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.container {
		display: flex;
		flex-wrap: wrap;
		gap: 5px;
		flex-direction: row;
		justify-content: space-around;
	}
	div.main {
		display: flex;
		flex-wrap: wrap;
		flex-direction: column;
	}
	div.prItems, div.npItems {
		border: 1px solid black;
		display: flex;
		flex-wrap: wrap;
		flex-direction: column;
		gap: 2px;
		margin-bottom: 4px;
	}
	
</style>
</head>
<body>
	<div class="container">
		
		<div class="left"> <h2>매출 TOP</h2>
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
			<a href="mc?type=productRank">
				<input type="button" value="전체 랭킹 보러가기" name="showAllProductRanking" />
			</a>
		</div>
		
		<form action="">
			<div class="main">
				<a href="mc?type=allProducts">
						<input type="button" value="전체상품리스트" name="showAllProduct" id="showAllProductList"/>
				</a>
				<select name="mcname" id="mc">
					<option value="대분류">대분류</option>
					<c:forEach var="mcName" items="${mcList }">
						<option value="${mcName}">${mcName}</option>
					</c:forEach>
				</select>
				<select name="scname" id="sc">
					<option value="중분류">중분류</option>
					<c:forEach var="scName" items="${scList }">
						<option value="${scName}">${scName}</option>
					</c:forEach>
				</select>
				상품검색창
				발주 예정 리스트
				발주 상품 명 (xxx 외 x개) 발주 총 금액 (총 xxxx원)
				<input type="submit" value="선택상품 발주하기" />
			</div>
		</form>
		<div class="right"><h2>이달의 신상</h2>
			<c:forEach var="vo" items="${npList }">
				<div class="npItems">
					<span>${vo.accName }</span>
					<span>${vo.PName }</span>
					<span>발주가격 : <fmt:formatNumber value="${vo.priceServer}" type="number" />원</span>
					<span>판매가격 : <fmt:formatNumber value="${vo.priceConsumer}" type="number" />원</span>
					<span>이익률 : <fmt:formatNumber value="${(vo.priceConsumer-vo.priceServer) / vo.priceServer *100 }" pattern=".0"/>%</span>
				</div>
			</c:forEach>
			<a href="mc?type=newProducts">
				<input type="button" value="신상품 보러가기" name="showNewProduct" />
			</a>
		</div>
	</div>
</body>
</html>