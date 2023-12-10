<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고현황</title>
<%-- jquery --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<%-- 부트스트랩 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%-- datepicker --%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<style>
	h2{
		text-align: center;
	}
	
	.mcName,#subname,#stockno{
		cursor: pointer;
		padding-left: 5px;
	}
	
	table, td, th {
	  border : 1px solid black;
	  border-collapse : collapse;
	}
	
	th, td {
	  vertical-align : top;
	}
	
	th{
		padding-left: 5px;
	}
	
	table{
		width:100%
	}
	
</style>

<script>
	$(document).ready(function(){
		mainList();
	});
	
	function mainList(){
		major();
		goSub();
	}
	
	// 대분류
	function major(){
		$.ajax({
			url : "ajax/stockAjaxMajor.jsp",
			success:function(data){
				
				let obj = JSON.parse(data);
				
				$.each(obj, function(i, e){
					
					let msg = "<div class='mcName' onclick = goSub(this,'" + e.mcNo + "')>" + e.mcName + "</div>";
					
					$("#major_list").append(msg);
				});
			}
		});
	}
	
	// 소분류 - 메인
	function goSub(){
		
		$.ajax({
			url : "ajax/stockAjaxSub.jsp",
			success:function(data){

				let obj = JSON.parse(data);
				
				$.each(obj, function(i, e){
					
					console.log(e);
					
					let msg = "<div id='subname' onclick = goStockNo(this,'" + e.scNo + "')>" + e.scName + "</div>";
					$('#sub_list').append(msg);
				});				
				
			}
		});
	}
	
	
	// 재고번호 - 메인
	function goStockNo(){
		$("#subname").css("font-weight","normal");
		
		$(obj).css("font-weight", "bold");
		
		$("#stock_list").show();
		
		$.ajax({
			url : "ajax/stockAjaxStockno.jsp",
			data: {
				"scno" : scno
			},
			success:function(data){
				
				let obj = JSON.parse(data.trim());
				
				// 리스트 초기화
				$("#stock_list *").remove();
				
				$.each(obj, function(i, e){
					
					console.log(e);
					let stno = '';
					
					if ( e.length != 0){
						stno = "<div id='stockno'>" + e.stockNo + "</div>";
					}
					else if(e.length == 0){
						stno = "<div id='stockno'> 해당 카테고리에 맞는 상품이 없습니다. </div>";
					}
					console.log("stno : " +stno);
					
					$("#stock_list").append(stno);
				});
			}
		});
	}
	
	
	// 소분류
	function goSub2(obj, mcno){
		
		$(".mcName").css("font-weight","normal");
		$(obj).css("font-weight", "bold");
		
		$("#sales_list").show();
		
		mcno = mcno.substr(0,3); 
		
		$.ajax({
			url : "ajax/stockAjaxSub.jsp",
			data : {
				"mcno" : mcno
			},
			success:function(data){

				$('#sub_list').show();
				let obj = JSON.parse(data);
				
				// 리스트 초기화
				$("#sub_list *").remove();
				
				$.each(obj, function(i, e){
					
					let msg = "<div id='subname' onclick = goStockNo(this,'" + e.scNo + "')>" + e.scName + "</div>";
					$('#sub_list').append(msg);
				});				
				
			}
		});
	}
	
	// 재고번호 불러오기
	function goStockNo2(obj, scno ){
		$("#subname").css("font-weight","normal");
		
		$(obj).css("font-weight", "bold");
		
		$("#stock_list").show();
		
		$.ajax({
			url : "ajax/stockAjaxStockno.jsp",
			data: {
				"scno" : scno
			},
			success:function(data){
				
				let obj = JSON.parse(data.trim());
				
				// 리스트 초기화
				$("#stock_list *").remove();
				
				$.each(obj, function(i, e){
					
					console.log(e);
					let stno = '';
					
					if ( e.length != 0){
						stno = "<div id='stockno'>" + e.stockNo + "</div>";
					}
					else if(e.length == 0){
						stno = "<div id='stockno'> 해당 카테고리에 맞는 상품이 없습니다. </div>";
					}
					console.log("stno : " +stno);
					
					$("#stock_list").append(stno);
				});
			}
		});
	}

</script>
<body>
	<div class="container" style="border: 1px solid red; margin-top:30px; padding-bottom: 20px;">
		<h2>재고리스트</h2>
		
		<div>
			<table>
				<colgroup>
					<col style="width:15%"/>
					<col style="width:15%"/>
					<col style="width:15%"/>
					<col style="width:33%"/>
					<col style="width:12%"/>
					<col style="width:10%"/>
				</colgroup>
				<thead>
					<tr>
						<th>
							<span>대분류</span>
						</th>
						
						<th>
							<span>소분류</span>
						</th>
						
						<th>
							<span>상품코드</span>
							<span id="sort">▼</span>
						</th>
						
						<th>
							<span>상품명</span>
							<span id="sort">▼</span>
						</th>
						
						<th>
							<span>가격(단위 : 원)</span>
						</th>
						<th>
							<span style="padding-left:35px;">수량</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<!-- <tr>
						<td id="main_list"></td>
					</tr>
				 -->
					<tr>
						<td id="major_list"></td>
						<td id="sub_list"></td>
						<td id="stock_list"></td>
						<td id="product_list"></td>
						<td id="cost_list"></td>
						<td id="cnt_list"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>