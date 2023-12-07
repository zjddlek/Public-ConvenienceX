
let idArray = [];
if ( $.cookie("pno") != null )	{
	idArray.push($.cookie("pno"));
}
	console.log("로딩후 : " + $.cookie("pno"));
$(()=>{
	$(".addOrder").on("click",(e)=>{
		let id = $(e.currentTarget).attr("id");
		if ( $.cookie("pno") != null ) {
			let pnoArray = $.cookie("pno");
			if ( pnoArray.indexOf(id) < 0 )	{
				idArray.push(id);
			}
			else alert("이미 추가된 상품입니다.");
		} else {
			idArray.push(id);
		}
		$.cookie("pno", idArray);
		console.log("클릭후 : " + $.cookie("pno"));
	});
});