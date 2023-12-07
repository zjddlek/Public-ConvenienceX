let totalPrice = 0;
let finalTotalProductName = null;
$(()=>{
	
	totalfn();
	
	$("input[type=number]").on("change",(e)=>{
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
		$.removeCookie("pno");
		for ( let i = 0; i < $(".perChecked").length; i++ ) {
			if ( $(".perChecked")[i].checked ) {
				let pno = $(".perChecked")[i].value;
				let count = $(".perChecked").parent().parent()[i].children[3].children[0].value;
				$.cookie(pno, count);
				console.log(pno + " : " + $.cookie(pno));
			}
		}
		alert("발주가 완료되었습니다.");
	})
		
})

function totalfn() {
	totalPrice = 0;
	for ( let i = 0; i < $(".totalPricePerProduct").length; i++ ) {
		totalPrice += parseInt($(".totalPricePerProduct")[i].innerText);
	}
	$(".totalPrice")[0].innerText = totalPrice + "원";
	
	finalTotalProductName = $(".orderName")[0].innerText;
	if ( finalTotalProductName.length > 8 ) {
		finalTotalProductName = finalTotalProductName.substring(0,7) + "... 외 " + ($(".orderName").length-1) + "개";
	} else {
		finalTotalProductName += " 외 " + ($(".orderName").length-1) + "개";
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
			finalTotalProductName = $(".orderName")[i].innerText;
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