
let ck = $.cookie;
let idArray = [];
if ( $.cookie("pno") != null )	{
	idArray.push($.cookie("pno"));
}
 
$(()=>{
	$(".addOrder").on("click",(e)=>{
		let id = $(e.currentTarget).attr("id");
		if ( ck("pno") != null ) {
			let pnoArray = ck("pno");
			if ( pnoArray.indexOf(id) < 0 )	idArray.push(id);
			 else alert("이미 추가된 상품입니다.");
		} else idArray.push(id); 
		ck("pno", idArray);
	});
});


//$(()=>{
//	$(".addOrder").on("click",(e)=>{
//		let id = $(e.currentTarget).attr("id");
//		if ( $.cookie("pno") != null ) {
//			let pnoArray = $.cookie("pno");
//			if ( pnoArray.indexOf(id) < 0 )	idArray.push(id);
//			 else alert("이미 추가된 상품입니다.");
//		} else idArray.push(id);
//		$.cookie("pno", idArray);
//	});
//});