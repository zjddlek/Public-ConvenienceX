<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		
		<div class="left">
			랭킹 리스트
			<a href="mc?type=productRank">
				<input type="button" value="더보기" name="showAllProductRanking" />
			</a>
		</div>
		<a href="mc?type=allProducts">
					<input type="button" value="전체상품리스트" name="showAllProduct" />
		</a>
		<form action="">
			<div class="main">
				
				상품검색창
				발주 예정 리스트
				발주 상품 명 (xxx 외 x개) 발주 총 금액 (총 xxxx원)
				<input type="submit" value="선택상품 발주하기" />
			</div>
		</form>
		<div class="right">
			신상품 리스트
			<a href="mc?type=newProducts">
				<input type="button" value="더보기" name="showNewProduct" />
			</a>
		</div>
	</div>
</body>
</html>