<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	#stock_list{
		overflow-y: scroll;
    	overflow-x: hidden;
	}
	#stock{
		height: 350px;
	}
	
</style>

<script>
	$(document).ready(function(){
		goStockMain();
	});
	
	
	// 재고번호 불러오기
	function goStockMain(){
		$.ajax({
			url : "ajax/stockAjaxStockno.jsp",
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
	
	// 소분류
	function goSub(obj, mcno){
		
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
			<div style="display: flex;">
				<div class="target-select__elements--control" style="margin-bottom: 10px; margin-right: 10px;"> 
					<div class="dropdown input-dropdown">
						<button class="btn dropdown-toggle btn-primary" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">대분류</button>
				        <ul class="dropdown-menu" style="overflow-y: scroll;">
				        	<li class="dropdown-item">전체</li>
							<li class="dropdown-item" onclick="change_Major(this, 'MC1', '식품');">식품</li>
							<li class="dropdown-item" onclick="change_Major(this, 'MC2', '주방용품');">주방용품</li>
							<li class="dropdown-item" onclick="change_Major(this, 'MC3', '생활용품');">생활용품</li>
							<li class="dropdown-item" onclick="change_Major(this, 'MC4', '문구');">문구</li>
						</ul>
				  	</div>
				</div>
				
				<div class="target-select__elements--control" style="margin-bottom: 10px;"> 
					<div class="dropdown input-dropdown">
						<button class="btn dropdown-toggle btn-primary" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">중분류</button>
				        <ul class="dropdown-menu" style="overflow-y: scroll;">
				        		<li class="dropdown-item">전체</li>
				        	<c:forEach var="vo" items="${sub_list}">
				        		<li class="dropdown-item" onclick="change_sub(this, '${vo.scNo}', '${vo.scName }');">${vo.scName }</li>	
				        	</c:forEach>
							
						</ul>
				  	</div>
				</div>
				
				<div class="search" style="margin-left: auto;">
				     <input type="text" placeholder="검색어를 입력해주세요.">
				     <button>검색</button>
				</div>
			</div>
			
		
			<table>
				<colgroup>
					<col style="width:15%"/>
					<col style="width:33%"/>
					<col style="width:12%"/>
					<col style="width:10%"/>
				</colgroup>
				<thead>
					<tr>
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
					<tr>
						<td id="stock">
							<div id="stock_list"></div>
						</td>
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