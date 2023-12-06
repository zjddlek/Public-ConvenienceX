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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<style>
	* {	margin: 0; }
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
		gap: 20px;
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
	form>div {
		text-align: center;
		padding: 0px, 15px, 0px;
	}
	.allOk, .orderOk { text-align: end;	}
	.search { text-align: center;}
	
</style>
<script>
	let totalPrice = 0;
	let finalTotalProductName = null;
	$(()=>{
		
		totalPrice = 0;
		for ( let i = 0; i < $(".totalPricePerProduct").length; i++ ) totalPrice = totalPrice + parseInt($(".totalPricePerProduct")[i].innerText);
		$(".totalPrice")[0].innerText = totalPrice + "원";
		
		finalTotalProductName = $(".orderName")[0].innerText;
		if ( finalTotalProductName.length > 8 ) finalTotalProductName = finalTotalProductName.substring(0,7) + "... 외 " + ($(".orderName").length-1) + "개";
		$(".totalName")[0].innerText = finalTotalProductName;
		
		
		$("input[type=number]").on("change",(e)=>{
			let cnt = e.currentTarget.value;
			let price = $(e.currentTarget).parent().parent().children()[2].innerText;
			
			if ( cnt >= 0 )	$(e.currentTarget).parent().parent().children()[4].children[0].innerText = cnt * price;
			
			totalfn();
		});
		$(".allChecked").on("change",(e)=>{
			if ( e.currentTarget.checked ) {
				for ( let i = 0; i < $(".perChecked").length; i++ ) {
					$(".perChecked")[i].checked = true;
				}
			} else {
				for ( let i = 0; i < $(".perChecked").length; i++ ) {
					$(".perChecked")[i].checked = false;
				}
			}
			totalfn();
		});
		
		$("input[value='선택상품 발주하기']").on("click",()=>{
			$.removeCookie("pno1");
			$.removeCookie("pno2");
			$.removeCookie("pno3");
			$.removeCookie("pno4");
		})
		
	})
	
	function totalfn() {
			for ( let i = 0; i < $(".totalPricePerProduct").length; i++ ) {
				if ($(".perChecked")[i].checked) {
					totalPrice = totalPrice + parseInt($(".totalPricePerProduct")[i].innerText);
					finalTotalProductName = $(".orderName")[i].innerText;
					if ( finalTotalProductName.length > 8 ) finalTotalProductName = finalTotalProductName.substring(0,7) + "... 외 " + ($(".orderName").length-1) + "개";
				}
			}
			$(".totalPrice")[0].innerText = totalPrice + "원";
			$(".totalName")[0].innerText = finalTotalProductName;
		}
	
	
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
			<div class="orderItems"  style="width:100%; height:683px; overflow:auto">
				<table class="table table-striped">
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
								<td><input class="perChecked" type="checkbox" value="${vo.PNo }" onchange="totalfn()" checked /></td>
								<td class="orderName">${vo.PName }</td>
								<td id="${vo.PNo }">${vo.priceServer}</td>
								<td><input type="number" name="" id="" value="1" style="text-align:center; width: 80px;" /></td>
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
				<a href="">
					<input type="button" value="선택상품 발주하기" />
				</a>
			</div>
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