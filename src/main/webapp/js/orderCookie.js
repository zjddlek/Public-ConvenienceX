
let idArray = [];
if ( $.cookie("pno") != null )	{
	idArray.push($.cookie("pno"));
	console.log("not null : " + $.cookie("pno"));
} else {
	console.log("null : " + $.cookie("pno"));
	
}

let ck = $.cookie;

$(()=>{
	$(".addOrder").on("click",(e)=>{
		let id = $(e.currentTarget).attr("id");
		if ( ck("pno") != null ) {
			let pnoArray = ck("pno");
			if ( pnoArray.indexOf(id) < 0 )	{
				idArray.push(id);
			} else alert("이미 추가된 상품입니다.");
		} else {
			idArray.push(id);
		}
		ck("pno", idArray);
		console.log("클릭후 : " + ck("pno"));
	});
});


//$(()=>{
//	$(".addOrder").on("click",(e)=>{
//		let id = $(e.currentTarget).attr("id");
//		if ( $.cookie("pno") != null ) {
//			let pnoArray = $.cookie("pno");
//			if ( pnoArray.indexOf(id) < 0 )	{
//				idArray.push(id);
//			} else alert("이미 추가된 상품입니다.");
//		} else {
//			idArray.push(id);
//		}
//		$.cookie("pno", idArray);
//		console.log("클릭후 : " + $.cookie("pno"));
//	});
//});