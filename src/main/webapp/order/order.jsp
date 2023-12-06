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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<style>
	* {
		margin: 0;
	}
	.container {
		display: flex;
		flex-wrap: wrap;
		gap: 5px;
		flex-direction: row;
		justify-content: space-between;
	}
	.main {
		display: flex;
		flex-wrap: wrap;
		flex-direction: column;
	}
	.prItems, .npItems {
		border: 1px solid black;
		display: flex;
		flex-wrap: wrap;
		flex-direction: column;
		gap: 2px;
		margin-bottom: 4px;
		text-align: center;
	}
	
</style>
<script>
	$(()=>{
		console.dir("label");
	})
</script>
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
		
		<div class="main">
			<div>
				<a href="mc?type=allProducts">
					<input type="button" value="전체상품리스트" name="showAllProduct" id="showAllProductList"/>
				</a>
			</div>
			<form action="mc?type=searchProduct">
				<div>
					<input type="hidden" name="type" value="searchProduct" />
					<label for="pname">상품명</label>
					<input type="text" name="pname" id="pname">
					<input type="submit" value="상품검색">
				</div>
			</form>
				<c:forEach var="vo" items="${searchList }">
				<div class="orderItems">
					<span>${vo.PName }</span>
					<span id="${vo.PNo }">발주가격 : <fmt:formatNumber value="${vo.priceServer}" type="number" />원</span>
					<input type="number" />
					<label></label>
				</div>
			</c:forEach>
				
				발주 상품 명 (xxx 외 x개) 발주 총 금액 (총 xxxx원)
			<input type="submit" value="선택상품 발주하기" />
		</div>
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