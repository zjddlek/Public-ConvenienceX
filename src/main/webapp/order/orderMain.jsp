<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="main">
	<div class="allOk">
		<a href="mc?type=allProducts">
			<input type="button" value="전체상품리스트" name="showAllProduct" id="showAllProductList"/>
		</a>
	</div>
	<div class="search">
		<form action="mc?type=searchProduct">
			<input type="hidden" name="type" value="searchProduct" />
			<label for="pname">상품명</label>
			<input type="text" name="pname" id="pname">
			<input type="submit" value="상품검색">
		</form>
	</div>
	<div class="orderItems"  style="width:930px; height:653px; overflow:auto">
		<table class="table table-striped table-hover table-sm">
			<tr style="text-align:center;">
				<th><input type="checkbox" name="" id="" class="allChecked" checked /></th>
				<th>상품이름</th>
				<th>발주가격</th>
				<th>수량</th>
				<th>총 가격</th>
			</tr>
			 
			<c:if test="${searchList != null }">
				<c:forEach var="vo" items="${searchList }">
					<tr>
						<td><input class="perChecked" type="checkbox" value="${vo.PNo }" onchange="perCheckedOnchange()" checked /></td>
						<td class="orderName" name="selectPname" value="${vo.PName }" >${vo.PName }</td>
						<td id="${vo.PNo }">${vo.priceServer}</td>
						<td><input type="number" name="countPerProduct" id="" value="1" style="text-align:center; width: 80px;" /></td>
						<td><label class="totalPricePerProduct" for="">${vo.priceServer}</label></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div>
		<table class="table">
			<tr style="text-align:center;">
				<th>  </th>
				<th>발주 상품 명</th>
				<th class="totalName"></th>
				<th>발주 총 금액</th>
				<th class="totalPrice"></th>
			</tr>
		</table>
	</div>
	<div class="orderOk">
		<a href="mc?type=insertOrders&sno=${svo.sno }">
			<input type="button" value="선택상품 발주하기" />
		</a>
	</div>
</div>