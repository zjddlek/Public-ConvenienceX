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
<!-- <script src="./js/order.js"></script> -->
<script>
let totalPrice = 0;
let finalTotalProductName = null;
var removeCookie = $.removeCookie;
var cookie = $.cookie;
$(()=>{
	
	totalfn();
	
	$("input[type=number]").on("change",(e)=>{
		console.log("numberChange");
		let cnt = e.currentTarget.value;
		let price = $(e.currentTarget).parent().parent().children()[2].innerText;
		
		if ( cnt >= 0 )	{
			$(e.currentTarget).parent().parent().children()[4].children[0].innerText = cnt * price;
		} else {
			e.currentTarget.value = 0;
			alert("수량을 0 미만으로 설정할 수 없습니다.");
		}
		totalPrice = 0;

		for ( let i = 0; i < $(".totalPricePerProduct").length; i++ ) {
			if ($(".perChecked")[i].checked) {
				totalPrice += parseInt($(".totalPricePerProduct")[i].innerText);
			}
		}
		$(".totalPrice")[0].innerText = totalPrice + "원";
	});
	
	$(".allChecked").on("change",(e)=>{
		console.log("allChecked");
		if ( e.currentTarget.checked ) {
			for ( let i = 0; i < $(".perChecked").length; i++ ) {
				$(".perChecked")[i].checked = true;
			}
			
			totalfn();
		} else {
			for ( let i = 0; i < $(".perChecked").length; i++ ) {
				$(".perChecked")[i].checked = false;
			}
			$(".totalPrice")[0].innerText = 0;
			$(".totalName")[0].innerText = "";
		}
	});
	$("input[value='선택상품 발주하기']").on("click",()=>{
		console.log("선택상품 발주하기");
		removeCookie("pno");
		for ( let i = 0; i < $(".perChecked").length; i++ ) {
			if ( $(".perChecked")[i].checked ) {
				let pno = $(".perChecked")[i].value;
				let count = $(".perChecked").parent().parent()[i].children[3].children[0].value;
				cookie(pno, count);
				console.log(pno + " : " + cookie(pno));
			}
		}
		alert("발주가 완료되었습니다.");
	})
		
})

function totalfn() {
	totalPrice = 0;
	let checkCount = 0;
	for ( let i = 0; i < $(".totalPricePerProduct").length; i++ ) {
		checkCount++;
		totalPrice += parseInt($(".totalPricePerProduct")[i].innerText);
	}
	$(".totalPrice")[0].innerText = totalPrice + "원";
	
	finalTotalProductName = $(".pname")[0].innerText;
//	if ( finalTotalProductName.length > 8 ) {
//		finalTotalProductName = finalTotalProductName.substring(0,7) + "... 외 " + ($(".pname").length-1) + "개";
//	} else {
//		finalTotalProductName += " 외 " + ($(".pname").length-1) + "개";
//	}
	if (checkCount > 1) {
		if ( finalTotalProductName.length > 8 ) finalTotalProductName = finalTotalProductName.substring(0,7) + "... 외 " + (checkCount-1) + "개";
		else finalTotalProductName = finalTotalProductName + " 외 " + (checkCount-1) + "개";
	} else {
		if ( finalTotalProductName.length > 8 ) finalTotalProductName = finalTotalProductName.substring(0,7) + "...";
	}
	$(".totalName")[0].innerText = finalTotalProductName;
	}

function perCheckedOnchange() {
	totalPrice = 0;
	let checkCount = 0;
	for ( let i = 0; i < $(".perChecked").length; i++ ) {
		if ($(".perChecked")[i].checked) {
			checkCount++;
			totalPrice += parseInt($(".totalPricePerProduct")[i].innerText);
		}
	}
	$(".totalPrice")[0].innerText = totalPrice + "원";
	
	for ( let i = 0; i < $(".perChecked").length; i++ ) {
		if ($(".perChecked")[i].checked) {
			finalTotalProductName = $(".pname")[i].innerText;
			if (checkCount > 1) {
				if ( finalTotalProductName.length > 8 ) finalTotalProductName = finalTotalProductName.substring(0,7) + "... 외 " + (checkCount-1) + "개";
				else finalTotalProductName = finalTotalProductName + " 외 " + (checkCount-1) + "개";
			} else {
				if ( finalTotalProductName.length > 8 ) finalTotalProductName = finalTotalProductName.substring(0,7) + "...";
			}
			break;
		}
	}
	$(".totalName")[0].innerText = finalTotalProductName;
	
}
</script>
</head>
<body>
	<div><jsp:include page="/main/nav.jsp"></jsp:include></div>
	<div class="container">

		<div class="main">
			<c:import url="./rankingTopSix.jsp"></c:import>
		
			<c:import url="./orderMain.jsp"></c:import>
			
			<c:import url="./newProductSix.jsp"></c:import>
		</div>
	</div>
</body>
</html>